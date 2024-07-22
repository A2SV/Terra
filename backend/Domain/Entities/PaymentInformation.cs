using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class PaymentInformation : BaseEntity
    {
        public required PaymentCurrency Currency { get; set; }
        public PaymentFrequency PaymentFrequency { get; set; }
        public double Cost { get; set; }
        public bool Negotiable { get; set;}
    }
}