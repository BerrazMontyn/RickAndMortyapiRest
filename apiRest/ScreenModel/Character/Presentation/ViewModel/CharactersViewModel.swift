//
//  CharactersViewModel.swift
//  apiRest
//
//  Created by Juan Manuel on 26/02/2023.
//

import Combine

protocol CharactersViewModel: BaseViewModel {
    var itemCharactersCount: Int { get }
    var lastPage: Bool { get }
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel
    func getUrlDetail(row: Int) -> String
}

final class CharactersViewModelImp: CharactersViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var lastPage: Bool {
        lastPageValidationUseCase.lastPage
    }
    
    
    var itemCharactersCount: Int {
        characters.count
    }
    
    private var characters: [Character] = []
    private let loadCharactersUseCase: LoadCharactersUseCases
    private var lastPageValidationUseCase: LastPageValidationUseCase
    private var imageDataUseCase: ImageDataUseCase
    
    init(
        loadCharactersUseCase: LoadCharactersUseCases,
        state: PassthroughSubject<StateController, Never>,
        lastPageValidationUseCase: LastPageValidationUseCase,
        imageDataUseCase: ImageDataUseCase
    ){
        self.loadCharactersUseCase = loadCharactersUseCase
        self.state = state
        self.lastPageValidationUseCase = lastPageValidationUseCase
        self.imageDataUseCase = imageDataUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            await loadCharactersUseCase()
          
        }
    }
    
    private func loadCharactersUseCase() async {
        let resultsCase = await loadCharactersUseCase.execute()
        updateStateUI(resultsCase: resultsCase)
    }
    
    private func updateStateUI(resultsCase: Result <[Character], Error>) {
        switch resultsCase {
            
        case .success(let charactersArray):
            lastPageValidationUseCase.updateLastPage(itemsCount: charactersArray.count)
            characters.append(contentsOf: charactersArray) // guardo todos los caracteres que voy recibiendo
            state.send(.success) //esto va a recargar el status
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    
    
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel {
        checkAndLoadMoreCharacters(row: row)
        return makeItemCharacterViewModel(row: row)
        
        
    }
    
    private func checkAndLoadMoreCharacters(row: Int) {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: characters.count,
            action: viewDidLoad)
    }
    
    private func makeItemCharacterViewModel(row: Int) -> ItemCharacterViewModel {
        let character = characters[row]
        return ItemCharacterViewModel(character: character,
        dataImageUseCase: imageDataUseCase)
    }
    
    func getUrlDetail(row: Int) -> String{
        let character = characters[row]
        return character.urlCharacter
    }
    
}
