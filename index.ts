import { definePluginEntry } from 'openclaw/plugin-sdk/plugin-entry';
import { Type } from '@sinclair/typebox';
import path from 'node:path';
import { createHash } from 'node:crypto';
import { invoke, TOOL_SPECS } from './lib/tools.js';

const root = path.basename(import.meta.dirname) === 'dist' ? path.resolve(import.meta.dirname,'..') : import.meta.dirname;
export default definePluginEntry({
  id:'foreman', name:'Foreman', description:'Strategic advisory content and persistent implementation tracking.',
  register(api) {
    api.registerTool(ctx => TOOL_SPECS.map(spec => ({
      name:spec.name, label:spec.name, description:spec.description,
      parameters:Type.Unsafe<Record<string,unknown>>(spec.parameters),
      async execute(_callId:string, params:Record<string,unknown>) {
        try {
          const scope = ctx.requesterSenderId ? createHash('sha256').update(`${ctx.agentId || 'default'}:${ctx.requesterSenderId}`).digest('hex').slice(0,32) : ctx.agentId || 'default';
          const result = invoke(root,spec.name,params,{workspace:ctx.workspaceDir,founder:scope,defaults:api.pluginConfig || {}});
          return {content:[{type:'text' as const,text:typeof result === 'string' ? result : JSON.stringify(result,null,2)}],details:{ok:true}};
        } catch(e) {
          return {content:[{type:'text' as const,text:`Error: ${e instanceof Error ? e.message : String(e)}`}],isError:true,details:{ok:false}};
        }
      }
    })), {names:TOOL_SPECS.map(spec=>spec.name)});
  }
});
