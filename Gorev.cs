//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IsTakipYazilimi_GYG
{
    using System;
    using System.Collections.Generic;
    
    public partial class Gorev
    {
        public int Id { get; set; }
        public string gorev_adi { get; set; }
        public string kullanici_id { get; set; }
    
        public virtual Kullanici Kullanici { get; set; }
    }
}