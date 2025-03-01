import SwiftUI

struct OpportunityDetailView: View {
    let opportunity: VolunteeringOpportunity

    var body: some View {
        VStack(spacing: 10) {
            Text(opportunity.org_name)
                .font(.title)
                .bold()
            
            Text("\(opportunity.category)")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("\(opportunity.date) | \(opportunity.time)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(opportunity.description)
                .font(.body)
                .padding()
            
            Link("View More", destination: URL(string: opportunity.link)!)
                .font(.headline)
                .foregroundColor(.blue)
                .padding()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}
