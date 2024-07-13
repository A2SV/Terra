using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class PaymentInformation : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public required PaymentCurrency Currency { get; set; }
        [MinLength(1)]
        public List<PaymentFrequency> PaymentFrequencies { get; set; } = new();
        public double Cost { get; set; }
        public bool Negotiable { get; set;}

        public required Property Property { get; set; }
    }
}