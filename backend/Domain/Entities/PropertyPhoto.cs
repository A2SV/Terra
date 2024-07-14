using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class PropertyPhoto : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public required string Url { get; set; }
        
        public required Property Property { get; set; }
    }
}