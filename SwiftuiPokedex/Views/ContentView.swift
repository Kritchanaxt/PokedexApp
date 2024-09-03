//
//  ContentView.swift
//  Pokedex
//
//  Created by Kritchanat on 3/9/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                        ) {
                            PokemonView(pokemon: pokemon)
                                .foregroundColor(.white)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
