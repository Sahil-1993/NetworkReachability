//
//  NetworkMonitor.swift
//  InternetConnectivity
//
//  Created by Sahil Arora on 2020-11-17.
//  Copyright © 2020 Sahil Arora. All rights reserved.
//

import Foundation
import Network


final class NetworkConnection{

    static let sharedInstance = NetworkConnection()
    private let queue = DispatchQueue.global()
    
    private let monitor:NWPathMonitor
    
    public private(set) var isConnected:Bool = true
    public private(set) var connectionType:connectionType = .unknown
    
    enum connectionType{
        case cellular
        case wifi
        case wired
        case unknown
    }
    private  init(){
         monitor  =  NWPathMonitor()
    }
    
    
    public func startMonitoring(){
        self.monitor.start(queue: self.queue)
        monitor.pathUpdateHandler = {[weak self] path in
            
            self?.isConnected = path.status == .satisfied
            self?.getConnectionType(path)
        }
    }
    
    public func stopMonitoring(){
        monitor.cancel()
    }
    private func getConnectionType(_ path:NWPath){
        
        if path.usesInterfaceType(.cellular)
        {
            self.connectionType = .cellular
        }
        else if path.usesInterfaceType(.wifi)
        {
            self.connectionType = .wifi
        
        }
         else if path.usesInterfaceType(.wiredEthernet)
        {
            self.connectionType = .wired
        }
        else
        {
            self.connectionType = .unknown
            
        }
    }
   
}
