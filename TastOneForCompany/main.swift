//
//  main.swift
//  TastOneForCompany
//
//  Created by Петр Постников on 22.06.2024.
//

import Foundation

//На вход подается матрица A x B (1 <= A, B <= 10^3; 1 <= A * B <= 10^3). Значение каждой ячейки - целое число 0 или 1. Найти наименьшее расстояние от каждой ячейки до ближайшей ячейки со значением 1. Расстояние между соседними ячейками равно 1.

let test1 = [[1,0,1],
             [0,1,0],
             [0,0,0]]

let test2 = [[1,0,0,0,1],
             [0,1,0,0,0],
             [0,0,0,0,1],
             [0,0,1,0,1]]

func myFunc(into: [[Int]]) -> [[Int]] {
    var result: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: into.first?.count ?? .zero), count: into.count)
    for (indexA, itemA) in into.enumerated() {
        for (indexB, itemB) in itemA.enumerated() {
            if itemB == 0 {
                for (indexC, itemC) in itemA.enumerated() {
                    if itemC == 1 {
                        if indexC != indexB {
                            if result[indexA][indexB] == 0 {
                                result[indexA][indexB] = abs(indexC - indexB)
                            } else if result[indexA][indexB] > abs(indexC - indexB) {
                                result[indexA][indexB] = abs(indexC - indexB)
                            }
                        }
                    }
                }
                for (indexD, itemD) in into.enumerated() {
                    if indexA != indexD {
                        if itemD[indexB] == 1 {
                            if result[indexA][indexB] == 0 {
                                result[indexA][indexB] = abs(indexD - indexA)
                            } else if result[indexA][indexB] > abs(indexD - indexA) {
                                result[indexA][indexB] = abs(indexD - indexA)
                            }
                        }
                    }
                }
            }
        }
    }
    return result
}

let result = myFunc(into: test1)    //[[0,1,0],
                                    // [1,0,1],
                                    // [2,1,2]]
let result2 = myFunc(into: test2)   //  [[0,1,2,1,0],
                                    //   [1,0,1,2,1],
                                    //   [2,1,1,1,0],
                                    //   [2,1,0,1,0]]

print(result)
print(result2)
