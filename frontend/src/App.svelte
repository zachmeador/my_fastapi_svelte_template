<script>
  import { onMount } from 'svelte';

  let message = 'loading...';
  let timestamp = '';

  onMount(async () => {
    try {
      const response = await fetch('http://localhost:8000/hello');
      const data = await response.json();
      message = data.message;
      timestamp = new Date(data.timestamp).toLocaleString();
    } catch (error) {
      message = 'error fetching data';
      console.error(error);
    }
  });
</script>

<main>
  <div class="container">
    <h1>{message}</h1>
    {#if timestamp}
      <p>received at: {timestamp}</p>
    {/if}
  </div>
</main>

<style>
  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
    text-align: center;
  }

  h1 {
    color: #333;
    margin-bottom: 1rem;
  }

  p {
    color: #666;
  }
</style>
