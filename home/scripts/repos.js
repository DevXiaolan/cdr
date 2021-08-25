#!/usr/bin/env node
const { execSync } = require('child_process');

execSync('git config --global http.sslverify false');
execSync(`git config --global user.email ${process.env.EMAIL}`);
execSync(`git config --global user.name ${process.env.NAME}`);

const repos = (process.env.REPOS || '').split(',') || [];
for (let i = 0; i < repos.length; i++) {
  const name = repos[i];
  const dir = name.split('/')[1];
  execSync(`git clone git@github.com:${name}.git ${dir}`);
}