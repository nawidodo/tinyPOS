# Application Overview  

This application was created with the following constraints and assumptions:  

- Built using **Xcode 16.2**.  
- No database engine was used.  
- Data is processed from a single JSON file.  
- Since the application uses JSON, many data structures are redundant and not normalized.  
- The main screen displayed is the **Order List**.  
- The screen flow is as follows:  
  **Order List → Order Detail → Invoice List → Invoice Detail**.  
- Data is displayed only, editing is not supported within the application.  
- Ideally, the **Customer** entity should have a one-to-many relationship with invoices to represent a receivable balance. However, for simplicity, this information is hardcoded in the **Customer** object.  
- The **Payment** object is implemented, but the list is intentionally not displayed on the screen.  
