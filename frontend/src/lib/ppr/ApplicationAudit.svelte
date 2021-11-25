<script>
  export let application;
</script>

<div class="columns">
  <div class="column">
    <p class="title">PPR Application</p>
    {#if application}
      <p class="subtitle is-size-6 is-italic">{application.application_id}</p>
    {/if}
  </div>
  <div class="column is-narrow">
    <a href={`/employee/ppr/applications/${application.application_id}`} class="button">
      View as employee
    </a>
  </div>
</div>
<hr />
<div>
  <p class="title is-size-5">History</p>
  <div class="columns is-multiline">
    {#if application}
      {#each application.events as evt, index}
        <div class="column is-4">
          <div class="card is-size-7">
            <div class="card-header">
              <div class="card-header-title">
                {evt.event_type.replace(/([a-z])([A-Z])/g, "$1 $2").replace("Events.", "")}
              </div>
              <div class="card-header-icon">
                <span class="tag">
                  {index}
                </span>
              </div>
            </div>
            <div class="card-content p-4">
              <table class="table is-narrow is-hoverable is-fullwidth">
                <tbody>
                  {#each Object.keys(evt.payload) as key}
                    <tr>
                      <td class="has-text-right">{key}</td>
                      <td>
                        <p>
                          {evt.payload[key] instanceof Date
                            ? `${evt.payload[key].toLocaleDateString()} ${evt.payload[
                                key
                              ].toLocaleTimeString()}`
                            : evt.payload[key]}
                        </p>
                      </td>
                    </tr>
                  {/each}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      {/each}
    {:else}
      <p>Loading...</p>
    {/if}
  </div>
</div>
