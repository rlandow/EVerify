using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EVerify.Models
{
    public class Page1 : IDisposable
    {
        private string _status;
        private string _middle;
        private bool? _certifycertifysignature;
        private bool? _reverifysignaturecertify;
        private bool? _signaturecertifyemp;
        private string _signaturecertifyemplogin;
        private string _signaturecertifyempip;
        private bool? _signaturecertifyprep;
        private string _prepfirstname;
        private string _preplastname;
        private bool? _change;

        public int FormID { get; set; }
        public string AppID { get; set; }
        public string Status
        {
            get {
                if (_status == null || _status == "") return null;
                else return _status.Trim(); 

            }
            set {
                //if (value != null) _status = value.Trim();
                //else
                _status = value;
                 

            }
        }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Middle
        {
            get {
                if (_middle == null) return null; 
                    if (_middle.Length > 1) return _middle.Substring(0, 1);
                else return _middle;
            }

            set { _middle = value; }
        }
        public string otherName { get; set; }
        public string Address { get; set; }
        public string AptNum { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public int Zip { get; set; }
        public int? Zip4 { get; set; }
        public int? Birth { get; set; }
        public int SSN { get; set; }
        public string Email { get; set; }
        public long? Phone { get; set; }
        public bool? Change {
            get { return _change; }
            set {
                if (value == false || value == null) _change = null;
                else _change = true;
                }
        }
        public string Citizenship { get; set; }
        public string AlienNum1 { get; set; }
        public int? AuthorizationExpDate { get; set; }
        public string AlienNum2 { get; set; }
        public string I94Num { get; set; }
        public string ForeignPPNum { get; set; }
        public string ForeignPPCountry { get; set; }
        public string Signature { get; set; }
        public bool? SignatureCertifyEmp {

            get {
                return _signaturecertifyemp;
            }
            set {
                if (value == false || value == null) _signaturecertifyemp = null;
                else _signaturecertifyemp = true;
            }

        }
        public string SignatureCertifyEmpLogin {
            get { return _signaturecertifyemplogin; }             

        set {
                if (value == "" || value == null) _signaturecertifyemplogin = null;
                else _signaturecertifyemplogin = value;
            
            }
        }
        public DateTime? SignatureCertifyEmpDate { get; set; }
        public string SignatureCertifyEmpIP {
            get { return _signaturecertifyempip; }
            set { if (value == "" || value == null) _signaturecertifyempip = null;
                else _signaturecertifyempip = value;
            }
        }
        public int? SignatureDate { get; set; }
        public bool? Assist { get; set; }
        public string SignaturePrep { get; set; }
        public bool? SignatureCertifyPrep {
            get { return _signaturecertifyprep; }
            set {
                if (value == false || value == null) _signaturecertifyprep = null;
                else _signaturecertifyprep = true;

            }
        }
        public string SignatureCertifyPrepLogin { get; set; }
        public DateTime? SignatureCertifyPrepDate { get; set; }
        public string SignatureCertifyPrepIP { get; set; }
        public int? SignaturePrepDate { get; set; }
        public string PrepLastName {
            get { return _preplastname; }
            set
            {
                if (value == "" || value == null) _preplastname = null;
                else _preplastname = value;
            }
        }
        public string PrepFirstName {
            get { return _prepfirstname; }
            set { if (value == "" || value == null) _prepfirstname = null;
                else _prepfirstname = value;
            } 

        }
        public string PrepAddress { get; set; }
        public string PrepCity { get; set; }
        public string PrepState { get; set; }
        public int? PrepZip { get; set; }
        public string DocA1Title { get; set; }
        public string DocA1Issuer { get; set; }
        public string DocA1Num { get; set; }
        public int? DocA1Date { get; set; }
        public string DocA2Title { get; set; }
        public string DocA2Issuer { get; set; }
        public string DocA2Num { get; set; }
        public int? DocA2Date { get; set; }
        public string DocA3Title { get; set; }
        public string DocA3Issuer { get; set; }
        public string DocA3Num { get; set; }
        public int? DocA3Date { get; set; }
        public string DocBTitle { get; set; }
        public string DocBIssuer { get; set; }
        public string DocBNum { get; set; }
        public int? DocBDate { get; set; }
        public string DocCTitle { get; set; }
        public string DocCIssuer { get; set; }
        public string DocCNum { get; set; }
        public int? DocCDate { get; set; }
        public string DocsAdditional { get; set; }
        public int? FirstWorkDate { get; set; }
        public string CertifySignature { get; set; }
        public bool? CertifyCertifySignature {
            get
            {
                return _certifycertifysignature;
            }
                
            set
            {
                if (value == false || value == null) _certifycertifysignature = null;
                else _certifycertifysignature = true;
            }

                
        }
        public string CertifyCertifySignatureLogin { get; set; }
        public DateTime? CertifyCertifySignatureDate { get; set; }
        public string CertifyCertifySignatureIP { get; set; }
        public int? CertifyDate { get; set; }
        public string CertifyTitle { get; set; }
        public string CertifyLastName { get; set; }
        public string CertifyFirstName { get; set; }
        public string CertifyCompany { get; set; }
        public string CertifyAddress { get; set; }
        public string CertifyCity { get; set; }
        public string CertifyState { get; set; }
        public int? CertifyZip { get; set; }
        public string ReverifyLastName { get; set; }
        public string ReverifyFirstName { get; set; }
        public string ReverifyMiddle { get; set; }
        public int? ReverifyRehireDate { get; set; }
        public string ReverifyDocTitle { get; set; }
        public string ReverifyDocNum { get; set; }
        public int? ReverifyDocDate { get; set; }
        public string ReverifySignature { get; set; }
        public bool? ReverifySignatureCertify {
            get {
                return _reverifysignaturecertify;
            }

            set {
                if (value == false || value == null) _reverifysignaturecertify = null;
                else _reverifysignaturecertify = true;
            }

        }
        public string ReverifySignatureCertifyLogin { get; set; }
        public DateTime? ReverifySignatureCertifyDate { get; set; }
        public string ReverifySignatureCertifyIP { get; set; }
        public int? ReverifyDate { get; set; }
        public string ReverifyName { get; set; }
        

        void IDisposable.Dispose()
        {

        }



    }
}
