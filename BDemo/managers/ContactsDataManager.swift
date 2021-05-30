//
//  ContactsDataManager.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 30/05/21.
//

import Foundation
import ContactsUI

class ContactsDataManager: NSObject {
    static let shared = ContactsDataManager()
    override init() {
        
    }
    func fetchContacts()-> [CNContact]{
        let contactStore = CNContactStore()
               let keysToFetch = [
                   CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                   CNContactPhoneNumbersKey,
                   CNContactEmailAddressesKey,
                   CNContactThumbnailImageDataKey] as [Any]

               var allContainers: [CNContainer] = []
               do {
                   allContainers = try contactStore.containers(matching: nil)
               } catch {
                   print("Error fetching containers")
               }

               var results: [CNContact] = []

               for container in allContainers {
                   let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

                   do {
                       let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                       results.append(contentsOf: containerResults)
                   } catch {
                       print("Error fetching containers")
                   }
               }
               return results
    }
}
