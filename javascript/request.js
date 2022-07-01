window.request=async function request(path){
  let el=await fetch(path).catch(function(e){return {err:true}})
  if(el.err)return await request(path)
  
  if(el.ok){
    req = await el.arrayBuffer().catch(e => null)
    if (req === null) /*body fetching failed but headers are true so... retry*/ return await request(path)
    const blob = new Blob([req])
    const text = await blob.text().catch(e => "")
    let json;
    return {status:el.status,text,blob,buffer:req}
  } else {
    return {error:el.status}
  }
}
