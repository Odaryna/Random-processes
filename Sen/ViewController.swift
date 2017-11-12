//
//  ViewController.swift
//  Sen
//
//  Created by Odaryna on 11/12/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

import Cocoa
import CorePlot

class ViewController: NSViewController {


    @IBOutlet weak var graphView: CPTGraphHostingView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // create graph
        let graph = CPTXYGraph(frame: .zero)
        let plotSpace = graph.defaultPlotSpace as! CPTXYPlotSpace!
        
        let xRange = plotSpace?.xRange.mutableCopy() as! CPTMutablePlotRange
        let yRange = plotSpace?.yRange.mutableCopy() as! CPTMutablePlotRange

        xRange.locationDouble = 0.0
        xRange.lengthDouble = 10.0
        
        yRange.locationDouble = 0.0
        yRange.lengthDouble = 10.0
        
        plotSpace?.xRange = xRange
        plotSpace?.yRange = yRange
        
        graph.add(plotSpace!)
        
        let axisLineStyle = CPTMutableLineStyle()
        axisLineStyle.lineWidth = 2.0
        axisLineStyle.lineColor = CPTColor.black()
        // 2 - Get the graph's axis set
        guard let axisSet = graph.axisSet as? CPTXYAxisSet else { return }
        // 3 - Configure the x-axis
        if let xAxis = axisSet.xAxis {
            xAxis.labelingPolicy = .none
            xAxis.majorIntervalLength = 1
            xAxis.axisLineStyle = axisLineStyle
        }
        // 4 - Configure the y-axis
        if let yAxis = axisSet.yAxis {
            yAxis.labelingPolicy = .fixedInterval
            yAxis.labelOffset = -10.0
            yAxis.minorTicksPerInterval = 3
            yAxis.majorTickLength = 30
            let majorTickLineStyle = CPTMutableLineStyle()
            majorTickLineStyle.lineColor = CPTColor.black().withAlphaComponent(0.1)
            yAxis.majorTickLineStyle = majorTickLineStyle
            yAxis.minorTickLength = 20
            let minorTickLineStyle = CPTMutableLineStyle()
            minorTickLineStyle.lineColor = CPTColor.black().withAlphaComponent(0.05)
            yAxis.minorTickLineStyle = minorTickLineStyle
            yAxis.axisLineStyle = axisLineStyle
        }
        
        self.graphView.hostedGraph = graph
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

