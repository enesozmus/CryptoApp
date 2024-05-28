//
//  ChartView.swift
//  CryptoApp
//
//  Created by enesozmus on 27.05.2024.
//

import SwiftUI

struct ChartView: View {
    
    // 🟥 MARK: Properties
    let data: [Double] = [
        // -> working with dummy data to avoid tire the free API
        71258.45067189028,
        71134.67085080172,
        70909.92941360822,
        70899.07595494622,
        70994.92906232657,
        71029.24786601581,
        71137.35307320395,
        71291.52510234059,
        70509.30102972775,
        70241.98689596509,
        69736.11198058298,
        69670.61303596775,
        69897.54683962486,
        69750.12214885878,
        69323.23138226781,
        69689.88171039242,
        69724.05748390061,
        70182.67699705489,
        70151.96507964293,
        70022.4234292104,
        70137.72961807002,
        69991.48298975686,
        69909.3388658249,
        69672.88311591213,
        69895.94254865812,
        69832.79846089588,
        69713.05775938,
        69987.77033043411,
        70004.88527417697,
        70215.003289933,
        69854.75817673716,
        69628.9122985429,
        69449.87364133101,
        70143.35752966364,
        70462.22602585802,
        70245.61837776998,
        69821.54834776589,
        69557.01309524845,
        69774.16959253259,
        69365.91559398868,
        69483.08176812224,
        69121.80628483312,
        69124.75647819617,
        69462.91322715081,
        69464.72855669515,
        69448.41622700443,
        69439.0776781832,
        69429.38537585516,
        69386.70249741386,
        69553.43106529697,
        69714.0003648465,
        69716.03929611793,
        69633.50394076176,
        69544.68410225779,
        69967.4107793987,
        69335.69345150235,
        67887.91865740553,
        67637.54778759033,
        68042.248666199,
        67794.67456828311,
        67560.35173527966,
        67201.75487691959,
        67076.96489091848,
        67904.70551122265,
        67936.31664332731,
        67671.5351603678,
        67756.15012710785,
        67860.30238942236,
        67729.16315720112,
        67965.65333068155,
        67792.55055628782,
        67647.76819232244,
        67286.07473770466,
        66941.73966994807,
        67132.65120610922,
        67205.73766342326,
        67435.73447151906,
        67329.23142149372,
        67305.68528648683,
        67438.85047380022,
        67100.25615755522,
        67816.04120024809,
        68327.26784825491,
        68638.34919711069,
        68908.15939227039,
        68950.52472592526,
        69125.93779692547,
        68849.45910684837,
        68870.57540293492,
        68752.397004538,
        68516.81503743347,
        68513.50178000105,
        68601.25022347916,
        68815.64466460436,
        71291.52510234059,
        68743.87758707978,
        68696.97429338803,
        68603.77919068921,
        68790.86585631571,
        68816.08783005807,
        69073.55340110054,
        69377.14519788539,
        69060.56125305928,
        69083.44269189866,
        69005.36551361212,
        69018.03004524765,
        68879.8403264127,
        68931.14146483659,
        69058.43556711482,
        69205.69972045138,
        69175.65607843085,
        69103.4914450543,
        69160.78533173342,
        69212.43529710067,
        69227.47513083645,
        69151.36220873042,
        69163.31272398737,
        68894.19465827703,
        69044.24042813492,
        68966.70450666099,
        69151.45869407622,
        69118.75862080802,
        69313.36213644143,
        69144.5906811381,
        69054.56406396972,
        69197.50845513552,
        69089.47845223182,
        68984.04478191007,
        69144.24141504313,
        69238.58831859007,
        68821.14081046284,
        68769.6621988354,
        68742.81011275374,
        68772.85862113793,
        68854.1997175027,
        68680.07532210716,
        68463.24002014192,
        68494.62424828911,
        68496.17323161339,
        68743.3648350921,
        69090.04354377337,
        69082.24640994534,
        68823.41717008018,
        68737.54439712655,
        68522.04544829176,
        68407.01523603172,
        68612.64017783185,
        68614.984570064,
        68557.58056137219,
        68531.33713160221,
        68419.95546506553,
        68583.82740051909,
        68881.99424982004,
        69451.69960811557,
        70425.80646846993,
        70078.54099320866,
        70058.24817903223,
        70021.02465943982,
        69455.65696035101,
        69568.83385279859,
        69748.98823947023,
        69504.52378576202,
        69400.79281064222,
        69324.01118442694,
        68507.27252853209,
        68665.59960975042,
        68003.66124092482,
        71291.52510234059
    ]
    let maxY: Double
    let minY: Double
    
    
    // 🟥 MARK: Initializers
    init() {
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
    }
    
    
    // 🟥 MARK: BODY
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    
                    // iPhone 15 Pro -> UIScreen.main.bounds.width = 393.0 -> ❗️ This isn't very of dynamic. So if we wanted to add some padding around the chart, it wouldn't go all the way to the edges and that would throw out all our data points. Because this is being based on the drawing a chart as wide as the screen.
                    // iPhone 15 Pro -> geometry.size.width = 393.0
                    // data.count = 168
                    // xPosition -> 2.3392857142857144 -  393.0
                    
                    //let xPosition = UIScreen.main.bounds.width / CGFloat(data.count) * CGFloat(index + 1)
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    //                    print("UIScreen.main.bounds.width = \(UIScreen.main.bounds.width)")
                    //                    print("geometry.size.width = \(geometry.size.width)")
                    //                    print("data.count = \(data.count)")
                    //                    print(xPosition)
                    //                    print(data.max())
                    
                    /*
                        Let assume that
                            The highest Bitcoin price in a given time period  -> 60.000
                            The lowest Bitcoin price in a given time period   -> 50.000
                     
                                let yAxis = 60.000 - 50.0000
                     
                        ✅ That would mean there's 10.000 possible data points between these two prices.
                     
                        Let assume that
                            One of the data points we have is 52.000.
                            So we're going to do is find the distance between the data point and the bottom.
                     
                            52.000 - 50.000 = 2.000
                            2.000 / 10.000(entire y axis) = 20 -> 20%
                     
                        ✅ This means that the data point we have should be 20% above our screen.
                        
                        ❓ (1 - (data[index] - minY) / yAxis)
                            -> inverse -> the coordinate system of the iphone is actually in reverse where point zero is at the top and point like a thousand is at the bottom
                     */
                    let yAxis = maxY - minY
                    let yPosition = (1 - (data[index] - minY) / yAxis) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: 0, y: 0))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .stroke(.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        }
    }
}

// 🟥 MARK: Preview
#Preview {
    ChartView()
}
