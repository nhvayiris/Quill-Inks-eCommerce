//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace assignment_draft
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_images
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_images()
        {
            this.tbl_products = new HashSet<tbl_products>();
        }
    
        public int ImageId { get; set; }
        public string Extension { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public string AltText { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_products> tbl_products { get; set; }
    }
}
