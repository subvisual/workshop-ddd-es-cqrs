<script>
  export let metrics;
</script>

<div class="level">
  <div class="level-item has-text-centered">
    <div>
      <p class="heading">Ongoing</p>
      <p class="title">{metrics.ongoing_applications}</p>
    </div>
  </div>
  <div class="level-item has-text-centered">
    <div>
      <p class="heading">Approved / Rejected</p>
      <p class="title">
        {metrics.approvals}
        /
        {metrics.rejections}
      </p>
    </div>
  </div>
  <div class="level-item has-text-centered">
    <div>
      <p class="heading">Issued</p>
      <p class="title">{metrics.issued_policies}</p>
    </div>
  </div>
  <div class="level-item has-text-centered">
    <div>
      <p class="heading">Sold</p>
      <p class="title">{metrics.total_sold} <span class="is-size-6">&euro;</span></p>
    </div>
  </div>
  <div class="level-item has-text-centered">
    <div>
      <p class="heading">Revenue</p>
      <p class="title">{metrics.total_sold * 0.067} <span class="is-size-6">&euro;</span></p>
    </div>
  </div>
</div>
