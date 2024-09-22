// The data layer
//
// Contains three types of classes:
//
// 1. Data Sources, which are 3rd party APIs used to communicate with foreign
// systems. For example:
//  - a remote database
//  - a REST API client
//  - a push notification system
//  - a Bluetooth interface.
// 2. Data Transfer Objects (DTOs), which are returned by the data sources. 
// DTOs are often represented as unstructured data (such as JSON) when sending data over the network
// 3. Repositories, which are used to access DTOs from various sources, 
// and make them available as type-safe model classes.
// see: https://codewithandrea.com/articles/flutter-repository-pattern/
//
// Feel free to delete this file once you have added components.
