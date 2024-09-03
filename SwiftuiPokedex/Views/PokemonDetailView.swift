//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Kritchanat on 3/9/2567 BE.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
                .foregroundColor(.brown)
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                    .foregroundColor(.red)
                    .font(.system(size: 16, weight: .bold))
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                    .foregroundColor(.blue)
                    .font(.system(size: 16, weight: .bold))
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                    .foregroundColor(.purple)
                    .font(.system(size: 16, weight: .bold))
            }
            .padding()
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
