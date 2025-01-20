;; Define constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-not-certified (err u103))

;; Define data maps
(define-map donations 
  { id: uint } 
  { donor: principal, recipient: principal, amount: uint, certified: bool, distributed: bool })

(define-map certifications principal bool)

;; Define variables
(define-data-var donation-counter uint u0)

;; Define functions

;; Register a new food donation
(define-public (register-donation (recipient principal) (amount uint))
  (let
    ((donation-id (var-get donation-counter)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (is-none (map-get? donations {id: donation-id})) err-already-exists)
    (map-set donations 
      {id: donation-id}
      {donor: tx-sender, recipient: recipient, amount: amount, certified: false, distributed: false})
    (var-set donation-counter (+ donation-id u1))
    (ok donation-id)))

;; Certify a food donation
(define-public (certify-donation (donation-id uint))
  (let
    ((donation (unwrap! (map-get? donations {id: donation-id}) err-not-found)))
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (ok (map-set donations 
         {id: donation-id}
         (merge donation {certified: true})))))

;; Distribute a certified food donation
(define-public (distribute-donation (donation-id uint))
  (let
    ((donation (unwrap! (map-get? donations {id: donation-id}) err-not-found)))
    (asserts! (is-eq tx-sender (get recipient donation)) err-owner-only)
    (asserts! (get certified donation) err-not-certified)
    (ok (map-set donations
         {id: donation-id}
         (merge donation {distributed: true})))))

;; Get donation details
(define-read-only (get-donation (donation-id uint))
  (map-get? donations {id: donation-id}))

;; Get total number of donations
(define-read-only (get-donation-count)
  (ok (var-get donation-counter)))

;; Audit function to check if a donation has been distributed
(define-read-only (audit-donation (donation-id uint))
  (match (map-get? donations {id: donation-id})
    donation (ok {
      certified: (get certified donation),
      distributed: (get distributed donation)
    })
    (err err-not-found)))