# Modulo

Modulo is a Radiant extension that adds tags for conditional rendering of child pages based on their ordinal values. For example, it can render different markup for odd or even children:

    <r:children:each>
      <r:if_odd>
        <div class="left">
      </r:if_odd>
      <r:if_even>
        <div class="right">
      </r:if_even>
          <r:content part="body" />
        </div>
    </r:children:each>

## New tags in Modulo

Modulo introduces the following new Radius tags:

* `<r:if_even>`
* `<r:unless_even>`
* `<r:if_odd>`
* `<r:unless_odd>`
