<script>
  let data = {
    submission: {
      lt: "10 min",
      pt: "5 min",
    },
    contracting: {
      lt: "30 min",
      pt: "5 min",
    },
    approval: {
      lt: "1 day",
      pt: "5 min",
    },
    billing: {
      lt: "1 day",
      pt: "5 min",
    },
    supplier: {
      lt: "5 days",
      pt: "30 min",
    },
    issuing: {
      lt: "30 min",
      pt: "5 min",
    },
    total: {
      lt: "8 days",
      pt: "80 min",
    },
  };
</script>

<div class="columns">
  <div class="column">
    <div class="box py-5 has-background-warning has-text-centered">Submission</div>
    <div class="box is-size-7">
      <p>LT: {data.submission.lt}</p>
      <p>PT: {data.submission.pt}</p>
    </div>
  </div>
  <div class="column">
    <div class="box py-5 has-background-warning has-text-centered">Contracting</div>
    <div class="box is-size-7">
      <p>LT: {data.contracting.lt}</p>
      <p>PT: {data.contracting.pt}</p>
    </div>
  </div>
  <div class="column">
    <div class="box py-5 has-background-warning has-text-centered">Approval</div>
    <div class="box is-size-7">
      <p>LT: {data.approval.lt}</p>
      <p>PT: {data.approval.pt}</p>
    </div>
  </div>
  <div class="column">
    <div class="box py-5 has-background-warning has-text-centered">Billing</div>
    <div class="box is-size-7">
      <p>LT: {data.billing.lt}</p>
      <p>PT: {data.billing.pt}</p>
    </div>
  </div>
  <div class="column">
    <div class="box py-5 has-background-link-dark has-text-centered has-text-white">Supplier</div>
    <div class="box is-size-7">
      <p>LT: {data.supplier.lt}</p>
      <p>PT: {data.supplier.pt}</p>
    </div>
  </div>
  <div class="column">
    <div class="box py-5 has-background-warning has-text-centered">Issuing</div>
    <div class="box is-size-7">
      <p>LT: {data.issuing.lt}</p>
      <p>PT: {data.issuing.pt}</p>
    </div>
  </div>
  <div class="column is-flex is-align-items-flex-end">
    <div class="box is-size-7 has-background-success">
      <p>Total LT: {data.total.lt}</p>
      <p>Total PT: {data.total.pt}</p>
    </div>
  </div>
</div>
