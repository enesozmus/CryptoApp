//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import Foundation

/*
 ✅ URL: URL: https://api.coingecko.com/api/v3/global

 ✅ JSON Response:
 {
     "data": {
     "active_cryptocurrencies": 14449,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1103,
     "total_market_cap": {
         "btc": 39169224.486748554,
         "eth": 720680955.6662567,
         "ltc": 31883046566.098644,
         "bch": 5485842574.766447,
         "bnb": 4496456843.593382,
         "eos": 3189866933164.0815,
         "xrp": 5026214878282.608,
         "xlm": 24410732950668.22,
         "link": 156877347682.9493,
         "dot": 367788298139.032,
         "yfi": 370659617.5825382,
         "usd": 2708214020120.966,
         "aed": 9947270095904.29,
         "ars": 2411691612893640,
         "aud": 4086635375654.0884,
         "bdt": 317295253724426.8,
         "bhd": 1020306091010.4719,
         "bmd": 2708214020120.966,
         "brl": 13993883484769.043,
         "cad": 3705784654432.5215,
         "chf": 2481219645596.4844,
         "clp": 2455348077062271.5,
         "cny": 19256755790070.098,
         "czk": 61510040110595.51,
         "dkk": 18636303958060.402,
         "eur": 2496393768751.222,
         "gbp": 2125674476178.9238,
         "gel": 7339259994527.805,
         "hkd": 21148984925928.63,
         "huf": 958049458583451.1,
         "idr": 43453293952841030,
         "ils": 9910018612057.547,
         "inr": 224940876660150.3,
         "jpy": 425040577322310.7,
         "krw": 3701316101299320,
         "kwd": 830991098147.9377,
         "lkr": 810331083971555.8,
         "mmk": 5680681132252807,
         "mxn": 45226632493216.13,
         "myr": 12740792857659.062,
         "ngn": 3957510095445568,
         "nok": 28660649824977.355,
         "nzd": 4423743024022.678,
         "php": 157630251058772.6,
         "pkr": 752513961790580.6,
         "pln": 10634520026720.297,
         "rub": 242671507810243.72,
         "sar": 10157427503865.707,
         "sek": 28892310452258.48,
         "sgd": 3656359748565.314,
         "thb": 99183488075620.47,
         "try": 87239695521942.48,
         "twd": 87330423399830.69,
         "uah": 108575593254897.78,
         "vef": 271173469834.7121,
         "vnd": 68981512884725350,
         "zar": 49883839815057.37,
         "xdr": 2043355602823.3276,
         "xag": 89197493227.44234,
         "xau": 1160225968.3600206,
         "bits": 39169224486748.555,
         "sats": 3916922448674855.5
     },
     "total_volume": {
         "btc": 822240.366282371,
         "eth": 15128534.729101595,
         "ltc": 669288918.2826657,
         "bch": 115158808.14973524,
         "bnb": 94389622.73301825,
         "eos": 66961687137.92628,
         "xrp": 105510303476.4234,
         "xlm": 512430109750.29694,
         "link": 3293169306.0166245,
         "dot": 7720612009.525917,
         "yfi": 7780886.747713317,
         "usd": 56850829115.308914,
         "aed": 208813095340.52927,
         "ars": 50626230698457.14,
         "aud": 85786650416.76047,
         "bdt": 6660662013624.854,
         "bhd": 21418265615.047028,
         "bmd": 56850829115.308914,
         "brl": 293759604204.62396,
         "cad": 77791832019.93289,
         "chf": 52085763171.35101,
         "clp": 51542667200812.52,
         "cny": 404237820424.4034,
         "czk": 1291218771198.5437,
         "dkk": 391213295474.0865,
         "eur": 52404298366.88409,
         "gbp": 44622158921.7768,
         "gel": 154065746902.48688,
         "hkd": 443959494727.26996,
         "huf": 20111374377830.453,
         "idr": 912171553155134.4,
         "ils": 208031112186.0486,
         "inr": 4721958916482.822,
         "jpy": 8922451862701.611,
         "krw": 77698028151892.61,
         "kwd": 17444165256.57051,
         "lkr": 17010470235890.834,
         "mmk": 119248859177620.98,
         "mxn": 949397476059.8363,
         "myr": 267454725572.9703,
         "ngn": 83076052515316.53,
         "nok": 601644365411.2378,
         "nzd": 92863214221.71791,
         "php": 3308974253794.48,
         "pkr": 15796773198423.045,
         "pln": 223239845990.97586,
         "rub": 5094160328236.65,
         "sar": 213224719679.87787,
         "sek": 606507385333.761,
         "sgd": 76754304388.57852,
         "thb": 2082059796513.246,
    "try": 1831335701440.6133,
         "twd": 1833240261066.8079,
         "uah": 2279218869840.934,
         "vef": 5692473519.315877,
         "vnd": 1448059928790205,
         "zar": 1047161572856.2687,
         "xdr": 42894121119.987885,
         "xag": 1872433791.1671944,
         "xau": 24355463.70128944,
         "bits": 822240366282.371,
         "sats": 82224036628237.1
     },
     "market_cap_percentage": {
         "btc": 50.30349019717237,
         "eth": 16.672439383781708,
         "usdt": 4.132298029397747,
         "bnb": 3.4218736952972986,
         "sol": 2.777031175913136,
         "steth": 1.289369727000653,
         "usdc": 1.2085919709105135,
         "xrp": 1.1032168522915335,
         "doge": 0.9097084077548809,
         "ton": 0.8218485856655917
     },
     "market_cap_change_percentage_24h_usd": 0.6482848033738543,
     "updated_at": 1716665671
     }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
