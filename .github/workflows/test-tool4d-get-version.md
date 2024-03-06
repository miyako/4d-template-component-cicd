name: Test reusable workflow action "Get Tool Version" 

on: 
  workflow_dispatch:

jobs:

  test:
    steps:
    
      - name: get values
        id: get
        uses: miyako/4D/.github/actions/get-tool@v1

      - name: print result
        run: |
          echo ${}
        with: 
          platform: ${{ steps.get.outputs.platform }}
          branch: ${{ steps.get.outputs.branch }}
          version: ${{ steps.get.outputs.version }}
          build: ${{ steps.get.outputs.build }}
          arch: ${{ steps.get.outputs.arch }}
