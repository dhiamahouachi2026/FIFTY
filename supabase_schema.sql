-- Türkçe Öğren Online - Supabase schema
-- Run this once in Supabase SQL Editor. Safe to run again.

create table if not exists public.user_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  date text not null,
  words jsonb not null default '[]'::jsonb,
  quiz_results jsonb not null default '{}'::jsonb,
  quiz_done boolean not null default false,
  history jsonb not null default '[]'::jsonb,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique(user_id, date)
);

alter table public.user_progress enable row level security;

drop policy if exists "Users manage own progress" on public.user_progress;
create policy "Users manage own progress"
  on public.user_progress
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create or replace function public.update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists trg_user_progress_updated_at on public.user_progress;
create trigger trg_user_progress_updated_at
  before update on public.user_progress
  for each row execute function public.update_updated_at();
