using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class PropertyVideo : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public required string Url { get; set; }
        
        public Property Property { get; set; } = null!;
    }
}