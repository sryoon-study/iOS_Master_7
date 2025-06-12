import Foundation

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    let track = zip(0 ..< genres.count, zip(genres, plays))
        .map { index, zipped in
            (index, zipped.0, zipped.1)
        }

    let genreDict = Dictionary(grouping: track) { _, genre, _ in genre }
        .mapValues { group in
            group.map { index, _, play in (index, play) }
        }

    let genrePlayCounts = genreDict.mapValues { $0.reduce(into: 0) { $0 += $1.1 } }

    let sortedGenres = genrePlayCounts.sorted { $0.value > $1.value }.map { $0.key }

    var result: [Int] = []

    for genre in sortedGenres {
        if let songs = genreDict[genre] {
            let sortedSongs = songs.sorted { $0.1 > $1.1 }
            result.append(contentsOf: sortedSongs.prefix(2).map { $0.0 })
        }
    }

    return result
}

let genres = ["classic", "pop", "classic", "classic", "pop"]
let plays = [500, 600, 150, 800, 2500]

let result = solution2(genres, plays)
print(result)


// 주석 기재용
func solution2(_ genres: [String], _ plays: [Int]) -> [Int] {
    
    // [(0, "classic", 500), (1, "pop", 600) ...] 만들기
    let track = zip(0 ..< genres.count, zip(genres, plays))
        .map { index, zipped in
            (index, zipped.0, zipped.1)
        }
    // ["pop": [(1, 600), (4, 2500)], "classic": [(0, 500), (2, 150), (3, 800)]] 만들기
    let genreDict = Dictionary(grouping: track) { _, genre, _ in genre }
        .mapValues { group in
            group.map { index, _, play in (index, play) }
        }
    
    // 장르별 플레이 카운트 체크하기
    // mapValues의 $0 : [(Int, Int)]
    //[(Int, Int)].reduce(into: 0) { result, track in result += track.1}
    let genrePlayCounts = genreDict.mapValues { $0.reduce(into: 0) { $0 += $1.1 } }
    
    //genrePlayCounts = ["classic": 1450, "pop": 3100]
    // 총 플레이수가 많은 장르순서대로 정렬
    let sortedGenres = genrePlayCounts.sorted { $0.value > $1.value }.map { $0.key }
    
    //결과 넣을 배열
    var result: [Int] = []

    for genre in sortedGenres {
        if let songs = genreDict[genre] {
            // songs = [(1, 600), (4, 2500)]
            let sortedSongs = songs.sorted { $0.1 > $1.1 }
            // 단일 요소를 append하는 것이 아니기 때문에 배열을 풀어서 넣는 contentsOf 사용
            result.append(contentsOf: sortedSongs.prefix(2).map { $0.0 })
        }
    }

    return result
}