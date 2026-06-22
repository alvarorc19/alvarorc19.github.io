import { defineCollection, z } from 'astro:content';

const projects = defineCollection({
    schema: z.object({
        title: z.string(),
        description: z.string(),
        pubDate: z.coerce.date().optional(),
        tags: z.array(z.string()),
    }),
});

export const collections = { projects };
