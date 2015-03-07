React = require("react")
Modal = require("../components/modal")

module.exports = React.createClass
  getInitialState: -> {}

  showTerms: (e)->
    e.preventDefault()
    @setState(showTerms: true)

  render: ->
    <div style={display: 'inline'}>
      <a href="#" onClick={@showTerms}>Terms of Service</a>
      <Modal visible={@state.showTerms} onClose={=> @setState(showTerms: false)}>
        <header><h1>Terms of Service</h1></header>
        <h2 id="samsung-samiio-platform-terms-of-service">Samsung SAMIIO Platform Terms of Service</h2>
        
        <p><strong>Last Updated: November 07, 2014</strong></p>
        
        <p>Welcome to the Samsung SAMIIO Platform (the "Platform"). Samsung Electronics Co., Ltd. and/or its subsidiaries and affiliates (collectively, "Samsung", "we", "us" or "our") provides certain features, software, tools, and other products and services ("Services") to you ("you", "your" or "Users") on or through our Platform. If you are using the Services on behalf of an organization, you agree to these Terms of Service for that organization and you represent and warrant that you have the authority to bind that organization to these Terms of Service (in which case, "you", "your" and "User" will refer to that organization).</p>
        
        <p><strong>Please read these Terms of Service carefully. They are a legal agreement between you and us that govern your use of the Platform. By using the Platform or the Services, you are agreeing to these Terms of Service.  If you do not agree to these Terms of Service, do not use the Platform or any of the Services.</strong></p>
        
        <ol>
          <li>
            <p><strong><em>You Retain Ownership of your Content.</em></strong> You retain ownership of the information, materials, documents, media files or other data or content that you upload, transmit, create, post, display or otherwise provide on or through the Services ("User Content").  Other than the rights you grant to Samsung under these Terms of Service, Samsung does not claim ownership of or any other rights to your User Content, and you retain ownership of any intellectual property rights that you hold in your User Content. In other words, the User Content that belongs to you remains yours.</p>
          </li>
          <li>
            <p><strong><em>Privacy and Protection of your Personal Data.</em></strong></p>
        
            <p>2.1 Our Privacy Policy, located at <a href="http://www.voiceofthebody.io/privacy">www.voiceofthebody.io/privacy</a>, explains how Samsung handles your personal data and information and protects your privacy when you use the Platform and the Services. By using the Platform or the Services, you agree that any personal data and information that you provide to us are subject to our Privacy Policy.</p>
          </li>
          <li>
            <p><strong><em>Other Applicable Terms.</em></strong> We offer a variety of Services, and you may use the Services to locate, browse and/or download applications, data files, services and other content, that may be offered by third parties that are not affiliated with Samsung (collectively, "Third Party Products").  Additional terms of service may apply to some of our Services or to some Third Party Products. If you use any Services or Third Party Products that require additional terms of service ("Special Terms"), you will need to agree to those Special Terms. If any Special Terms are inconsistent with these Terms of Service, the Special Terms will control.</p>
          </li>
          <li>
            <p><strong>Account and Registration Data.</strong></p>
        
            <p>4.1 To use the Services, you will need to register and open an account.  Your account will be created using Samsung's single sign on process ("SingleSignOn").  Once you open an account with Samsung, SingleSignOn automatically registers you for all Samsung services, and you can sign on and sign off from all Samsung services and through all devices at once. </p>
        
            <p>4.2 You can access and change your password or registration data at any time by either accessing the relevant Samsung account application on your device or by visiting <a href="https://account.samsung.com/">https://account.samsung.com/</a>. </p>
        
            <p>4.3 You will keep your account safe and secure at all times, in particular by avoiding obvious user names or passwords, and by changing your password regularly. </p>
        
            <p>4.4 You are entirely responsible for maintaining the confidentiality of your user name  and password, and for any and all activity that occurs under your account, so you should not disclose your password(s) or grant any third party access to your account. Samsung may treat any instructions as coming from you if they are received from or issued by a third party using your user name and password or registration data.</p>
        
            <p>4.5 You agree not to use the account of any other user without permission of the user or person holding the respective account.</p>
        
            <p>4.6 You will let us know immediately if you learn of any unauthorized use of any of your account or registration data or any other breach of security.</p>
          </li>
          <li>
            <p><strong><em>Closing Your Account.</em></strong></p>
        
            <p>5.1 You may close your Account at any time.</p>
        
            <p>5.2 Samsung may also disable your account at any time and without notice if:</p>
        
            <ul>
              <li>We believe that you are in breach of these Terms of Service.</li>
              <li>You have demonstrated (whether directly or through your actions or statements or otherwise) that you do not intend to comply with these Terms of Service;</li>
              <li>We or any of our suppliers or partners believe the law requires us to do so; or</li>
              <li>We decide to stop providing the Services.</li>
            </ul>
        
            <p>5.3 Terminating this Agreement will not prejudice any rights, obligations and liabilities that you or Samsung have accrued or incurred while these Terms of Service were in effect.</p>
        
            <p>5.4 If Samsung disables access to your account, you may not be able to access or use the Services, your account details or any files, including your User Content, or Third Party Products that are stored with your account.  Samsung may allow you to backup the User Content that you have stored with Samsung through the use of the Services.  You understand that Samsung may delete your User Content or may retain your User Content indefinitely.  </p>
          </li>
          <li>
            <p>Use of the Services; Limitations on Use of the Services.</p>
        
            <p>6.1 During the term of these Terms of Service, Samsung grants you a personal, non-exclusive, non-transferable, limited privilege to use the Platform and Services, and unless otherwise specified in these Terms of Service or any applicable Special Terms, you can use the Services for personal and non-commercial purposes only. You may not (a) reproduce, duplicate, copy, sell, trade or resell any of the Services or parts of the Services, (b) remove any proprietary notice language corresponding to the Services, or (c) make modifications to any of the Services.</p>
        
            <p>6.2 You will only use or attempt to use the Services through the interface Samsung provides to you.</p>
        
            <p>6.3 You will comply with and follow all instructions that Samsung provides in connection with the Services.</p>
        
            <p>6.5 You will not use other unauthorized or illegitimate means to access or attempt to access any portion or feature of the Services, or any other systems or networks connected to the Services or to any Samsung server, or to any of the services offered on or through the Services, including by hacking automated tools (including software and/or hardware), functions, services or otherwise (including scripts or web crawlers).</p>
        
            <p>6.6 You will always observe these Terms of Service and any applicable law or regulation that applies to your use of the Services, including the laws and regulations of the place where you access the Services and/or the place where you live. </p>
        
            <p>6.7 You will not engage in any activity that may interfere with or disrupt the Services or any servers, networks or other equipment connected to the Services.</p>
        
            <p>6.8 You understand that if you use any Services over a mobile network, your network provider may charge you for access to its network, the duration of your mobile phone's / mobile device's or other device's connection to the network and the data volume used to use the Services or Third Party Products.  You are entirely responsible for such costs.</p>
          </li>
          <li>
            <p>Payments </p>
        
            <p>7.1 Various payment processing methods may be available for the purchase of any Services or Third Party Products.  You agree to abide by any relevant terms and conditions or other legal agreement, whether with Samsung or a third party, that governs your use of a given payment processing method.  </p>
        
            <p>7.2 Samsung may add or remove payment processing methods at any time, with or without notice.</p>
        
            <p>7.3 Your total price will include any applicable sales tax.  All sales are final.</p>
        
            <p>7.4 You are responsible for the timely payment of all products and services you purchase through your account, whether from Samsung or a third party.  All fees will be billed to the credit card or payment processing account you designate during the registration process.  You must make any changes to your payment method online.</p>
        
            <p>7.5 Prices for any products and services offered via the Services, whether from Samsung or a Third Party, may change at any time, and the Services do not provide price protection or refunds even if there is a price reduction or promotional offering.</p>
        
            <p>7.6 If a Third Party Product becomes unavailable after a transaction but before you download or receive the Third Party Product, your sole and exclusive remedy is a refund.  If technical problems prevent or unreasonably delay delivery of your Third Party Product, your sole and exclusive remedy is either replacement or refund of the price paid, as determined by Samsung.  </p>
          </li>
          <li>
            <p>Samsung's Rights to Change or Stop Any Services.</p>
        
            <p>8.1 Although we strive to keep you updated and informed of our current and upcoming Services, Samsung may at any time, with or without notice:</p>
        
            <ul>
              <li>change, suspend or stop providing or offering the Services or any part of the Services (either worldwide or in the country where you are a resident or from where you are using the Services);</li>
              <li>disable or suspend your use of the Services including access to your account(s) and any files or other content contained in your account(s) either temporarily or permanently;</li>
              <li>limit the number of transmissions you may send or receive through the Services or on the amount of storage space allocated to the Services or any part of the Services; </li>
              <li>prescreen, review, flag, filter, modify, refuse, reject, block access to or remove any or all content, including User Content, from the Services; or</li>
              <li>remove your access to any Third Party Product accessible through the Services that Samsung discovers violates the legal agreements developers enter into with Samsung, or violates any other agreements or applicable laws or regulations.  Samsung may remove any such Third Party Product from your device remotely.</li>
            </ul>
          </li>
          <li>
            <p>How Samsung May Change These Terms of Service.</p>
        
            <p>9.1 Samsung may modify, update, add to, discontinue, remove or otherwise change any portion of these Terms of Service at any time and may require you to accept new or updated Terms of Service as a condition of your continued use of the Platform, or may otherwise notify you of changes through the Platform. </p>
        
            <p>9.2 When Samsung amends these Terms of Service, we will revise the "Last Updated" date located at the top of these Terms of Service.  For changes that we consider to be material, we will place a notice on the Platform by revising the link on the homepage for a reasonable amount of time. The link will say something like, "Updated Terms of Service". If you provide information to us or access or use any Services in any way after these Terms of Service have been changed, you will be deemed to have unconditionally consented and agreed to such changes.  The most current version of these Terms of Service will be available on the Platform and will supersede all previous versions.</p>
          </li>
          <li>
            <p>Software and Software Updates and Updates to the Services.  Services originating from Samsung or the Services may communicate with Samsung servers from time to time to check for available updates, such as bug fixes, patches, enhanced functions, missing plug-ins and new versions (collectively, "Software Updates").  By using or installing these Services and/or Third Party Products, you agree to such automatically requested and installed Software Updates.  These Software Updates may be in various forms and are generally provided for the purposes of improving the performance, security and reliability of the Services or Third Party Product or the device you use to access the Services.</p>
          </li>
          <li>
            <p>Content Provided in or through the Services and Content Rights.</p>
        
            <p>11.1 All content available in or through the Services or accessible as part of or by the use of the Services (including audio and sound files, data files, images, music, photographs, software, videos and written text) ("Content") is entirely the responsibility of the originator of such Content.  The Content may include, without limitation, advertisements, promotional material, sponsored elements or other material.</p>
        
            <p>11.2 The Content may be protected by proprietary or intellectual property rights of third parties (such as partners, advertisers and sponsors or their agents who provide Content to Samsung).  You are not permitted to modify, rent, lease, loan, sell, distribute or create derivative works based on any Content (either in whole or in part) or to grant licenses to the Content.</p>
        
            <p>11.3 Using the Services exposes you to the risk that you may find some Content offensive, indecent or objectionable and any use of the Services is entirely at your own risk.</p>
          </li>
          <li>
            <p><strong><em>User Content and User Content License.</em></strong></p>
        
            <p>12.1 You represent that you have sufficient rights to the User Content to grant us the User Content License below, and that your User Content does not violate or infringe anyone's intellectual property or other rights.</p>
        
            <p>12.2 You hereby grant Samsung a worldwide, royalty-free, fully paid up, non-exclusive license to copy, reproduce, adapt, modify, edit, distribute, translate, digitize, publish, and otherwise use the User Content ("User Content License") to the full extent necessary to provide the Services. </p>
        
            <p>12.3 The User Content License includes a right for Samsung to (a) perform all technical steps necessary to process and prepare the User Content for use in the Services, including any modification and/or adaption required to provide the Services to you or users generally and/or to transmit or distribute the User Content over public networks and in media and (b) make available and sublicense the User Content to third parties for the use of the User Content in connection with the provision of Services by these third parties. </p>
        
            <p>12.4 In addition, we may use your User Content, including but not limited to, in an aggregate, non-identifying manner to create or to have a third party create statistical data for internal or business purposes.  We agree that we will not disclose any such data or information in a manner that would reveal your identity, or otherwise allow a third party to identify you, or your User Content. </p>
        
            <p>12.5 You are responsible for protecting and enforcing any intellectual property rights you have in your User Content and Samsung is not obliged to protect or enforce any intellectual property rights you have in your User Content on your behalf.</p>
        
            <p>12.6 You are responsible for backing up your User Content stored with Samsung or through the Services to another location outside the Services (e.g.,  by means of creating local copies or backups with specialized online backup services) to avoid loss of your User Content and other data.</p>
        
            <p>12.7 If you send or post certain specific submissions at our request or if you send us any unsolicited creative suggestions, ideas, notes, photographs, drawings, concepts, or any other information (the "Submissions"), your Submissions will be treated as non-confidential and non-proprietary.  "Submissions" are separate and apart from User Content.   You grant us the right to use any Submission without restriction and for any purpose without compensation or attribution to you, and you hereby irrevocably waive, release and give up any claim that any use of such Submission violates any of your rights related to such Submissions.  Samsung will not be liable for any use or disclosure of any Submissions.  You represent that such Submission is original with you and does not violate or infringe upon the rights of any third parties, including, without limitation, any intellectual property rights or rights of publicity and/or privacy. </p>
          </li>
          <li>
            <p><strong><em>Samsung Services License.</em></strong></p>
        
            <p>13.1 As between you and Samsung, Samsung owns all right, title and interest in and to the Services, including without limitation all applicable intellectual property rights or other proprietary rights in such Services, regardless of whether registered/legally secured or not.</p>
        
            <p>13.2 Except for the rights granted to you in these Terms of Service and any Special Terms, Samsung retains all rights in and to the Services.</p>
        
            <p>13.3 You are not permitted to (a) grant any third party a license to use the Services or otherwise to access your account or the Services, (b) use the Services to provide services to any third parties or (c) otherwise assign, grant a sublicense in, or grant a security interest in or over any of the rights granted to you in these Terms of Service, loan or lease the Services and/or otherwise transfer any such rights to any third party.</p>
        
            <p>13.4 You may not copy, edit, modify, alter or create a derivative work of, reverse engineer, decompile or otherwise attempt to extract the source code of the Services (or any part of the Services), unless expressly permitted by Samsung in writing, or to the extent permitted under the laws applicable to you, and you will not permit or grant a license to any third party to do so.</p>
          </li>
          <li>
            <p><strong><em>Trademarks.</em></strong></p>
        
            <p>14.1 You may not use any of Samsung's trade names, trademarks, service marks, logos, domain names, or other distinctive brand features without obtaining advance written consent from Samsung.  </p>
        
            <p>14.2 You may not remove, obscure, conceal, modify or otherwise change any proprietary rights notices, signs, trademarks, service marks, trade names, logos or other marks of Samsung or any third party (including copyright and trademark notices) (the "Marks") that pertain to, are affixed to or which are contained within the Services and you agree not to use any such Marks in a way that may confuse or mislead others about the owner, license holder or authorized user of such Marks.</p>
          </li>
          <li>
            <p><strong><em>Your Warranties and Representations.</em></strong></p>
        
            <p>15.1 You are entirely responsible for the User Content provided by you and for any consequences arising in connection with that User Content (including any loss or damage suffered or incurred by Samsung).  In particular, you warrant and represent to Samsung that:</p>
        
            <ul>
              <li>You own all rights pertaining to the User Content or are otherwise authorized to grant Samsung the User Content license;</li>
              <li>The User Content does not and will not infringe any intellectual property or other third party rights;</li>
              <li>The User Content does not and will not contain any material which is harmful, inaccurate, pornographic, abusive, obscene, threatening, defamatory, or which is otherwise illegal or which does not comply with applicable law or any content guidelines provided by Samsung; </li>
              <li>The User Content does not and will not contain any viruses or other harmful software, code or similar means and devices which could damage, harm, disable or otherwise impact or limit the function and performance of the Services and/or any device accessing such User Content, including without limit    servers, network nodes or any similar equipment;</li>
              <li>The User Content will comply and conform to any age classification rules and requirements (including   accurate and adequate classification and rating of any User Content, as the case may be) under the laws of any country, including the country in which you are a resident or from which you are using the Services; and</li>
              <li>The use of the User Content by Samsung or Third Party Products will not require Samsung to pay any kind  of monetary contribution (including license fees, dues or otherwise) to any third party.</li>
            </ul>
        
            <p>15.2 You agree to indemnify and hold harmless Samsung from any loss, damage, liability or expense incurred by Samsung as a result of any breach of your representations, warranties, covenants or obligations under these terms and conditions.</p>
          </li>
          <li>
            <p><strong><em>Third Party Products.</em></strong></p>
        
            <p>16.1 Samsung is not responsible for and has no control over the content (including advertisements, products and other materials) on or through Third Party Products or any links to third party websites and is not liable for any damage or loss incurred by you due to or as a result of the content (including any reliance by you on the availability, accuracy, applicability or completeness of the content) from these Third Party Products or third party websites.</p>
        
            <p>16.2 This Agreement does not affect your legal relationship with any third party and Samsung is not liable or responsible for any services, goods or software provided to you by any third party.</p>
          </li>
          <li>
            <p><strong><em>Samsung's Warranties and Representations.</em></strong></p>
        
            <p>17.1 EXCEPT AS OTHERWISE SET FORTH IN THESE TERMS OF SERVICE, THE SERVICES, INCLUDING WITHOUT LIMITATION, ANY UPDATES, FROM SAMSUNG ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS, AND SAMSUNG MAKES NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY WITH RESPECT TO THE SERVICES AND SAMSUNG EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES AND CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE OR NON-INFRINGEMENT.  YOUR USE OF THE SERVICES IS AT YOUR OWN DISCRETION AND RISK, AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE THAT RESULTS FROM THE USE OF THE SERVICES INCLUDING, BUT NOT LIMITED TO, ANY DAMAGE TO YOUR COMPUTER SYSTEM, HARDWARE, SOFTWARE OR LOSS OF DATA.</p>
          </li>
          <li>
            <p><strong><em>Your Liability.</em></strong></p>
        
            <p>18.1 You are entirely responsible for any breach of your obligations under:</p>
        
            <ul>
              <li>These Terms of Service; and</li>
              <li>Any applicable law or regulation in the relevant jurisdictions, including the jurisdiction where you are a resident or from where you are using the services and for the consequences of any such breach, including any loss or damage which Samsung or any third party may incur or suffer.  Samsung will have no responsibility to you or to any third party in respect of such breach.</li>
            </ul>
          </li>
          <li>
            <p><strong><em>Samsung's Liability.</em></strong>  SUBJECT TO THE TERMS AND CONDITIONS OF THESE TERMS OF SERVICE AND TO THE FULLEST EXTENT ALLOWED AND PERMITTED BY APPLICABLE LAWS AND REGULATIONS, SAMSUNG SHALL NOT, UNDER ANY CIRCUMSTANCES, BE LIABLE TO YOU OR ANY THIRD PARTY THROUGH YOU FOR PERSONAL INJURY OR ANY CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, INDIRECT, PUNITIVE OR SPECIAL DAMAGES WHATSOEVER, INCLUDING, WITHOUT LIMITATION, DAMAGES FOR DELAY OF DELIVERY, LOSS OF PROFITS, LOSS OF DATA, LOSS OF GOODWILL, BUSINESS INTERRUPTION OR ANY OTHER COMMERCIAL DAMAGES OR LOSSES, ARISING OUT OF OR IN RELATION TO THIS AGREEMENT, YOUR USE OF THE SERVICES, ANY THIRD PARTY PRODUCTS OR OTHER PRODUCTS OR SERVICES PROVIDED BY OR THROUGH SAMSUNG UNDER THIS AGREEMENT, WHETHER BASED ON BREACH OF CONTRACT, BREACH OF WARRANTY, TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY OR OTHERWISE, EVEN IF SAMSUNG HAS BEEN ADVISED OF OR IS AWARE OF THE POSSIBILITY OF SUCH DAMAGES AND NOTWITHSTANDING THE FAILURE OF ESSENTIAL PURPOSE OF ANY REMEDY. YOUR UNDERSTANDING, ACKNOWLEDGEMENT AND ACCEPTANCE OF THESE TERMS OF SERVICE ARE THE LEGAL BASIS AND CONSIDERATION FOR THE LICENSES GRANTED UNDER IT.  In no event shall Samsung's total liability to you under these Terms of Service for all damages (other than as may be required by applicable law in cases involving personal injury) exceed the amount of fifty dollars ($50.00).</p>
          </li>
          <li>
            <p><strong><em>Language of this Agreement.</em></strong>  Samsung may provide you with a translation of the English version of these Terms of Service.  This translation is provided for your convenience only.  If there is any conflict between the English language version and the translation version of these Terms of Service and to the extent permissible by applicable law, the English language version takes precedence.</p>
          </li>
          <li>
            <p><strong><em>Procedure for Making Claims and Notices Regarding Infringement of Intellectual Property Rights and Other Rights.</em></strong></p>
        
            <p>21.1 Samsung may respond to notices of alleged copyright infringement or violation of other laws in accordance with applicable law and may terminate, suspend or block access (either temporary or permanently) to accounts of Users who repeatedly infringe copyright laws or violate other applicable law.</p>
        
            <p>21.2 Any notices regarding any copyright infringement or violation of other laws by the Services, any content provided with or displayed in the Services or any User Content should be sent to <a href="&#109;&#097;&#105;&#108;&#116;&#111;:&#086;&#079;&#084;&#066;&#064;&#115;&#115;&#105;&#046;&#115;&#097;&#109;&#115;&#117;&#110;&#103;&#046;&#099;&#111;&#109;">&#086;&#079;&#084;&#066;&#064;&#115;&#115;&#105;&#046;&#115;&#097;&#109;&#115;&#117;&#110;&#103;&#046;&#099;&#111;&#109;</a>.</p>
          </li>
          <li>
            <p><strong><em>General Provisions.</em></strong></p>
        
            <p>22.1 Samsung will rely only on the written Terms of Service.  Any representations, statements or agreements made or entered into elsewhere, whether directly or indirectly, written or oral or in advertising are not binding towards Samsung unless expressly confirmed in writing by Samsung to you.</p>
        
            <p>22.2 Samsung may provide you with notices (including notices relating to changes to the Agreement or termination of the Services or parts thereof) by email, ordinary mail, or postings on or via the Services.</p>
        
            <p>22.3 Failure by Samsung to exercise or enforce any legal right or remedy under these Terms of Service or which Samsung has the benefit of under any applicable law will not be construed as a formal waiver of Samsung's rights or remedies.</p>
        
            <p>22.4 If any provision of these Terms of Service is held to be invalid, illegal or unenforceable (in whole or in part) as determined by a court of law having jurisdiction to decide on this matter, the validity, legality and enforceability of the remaining provisions shall not in any way be affected or impaired.</p>
        
            <p>22.5 You may not transfer, assign or otherwise dispose of these Terms of Service or any of your rights or obligations arising under these Terms of Service without the prior written consent of Samsung.</p>
        
            <p>22.6 These Terms of Service shall be governed by and construed in accordance with the laws of the State of California, USA, without regard to any conflict-of-laws rules. All disputes, controversies or claims between the parties arising out of or in connection with these Terms of Service (including its existence, validity or termination) will be finally resolved by arbitration to be held in Santa Clara, California and conducted in English under the Rules of Arbitration of the International Chamber of Commerce. The arbitral award shall be final and binding on the parties. Except to the extent entry of judgment and any subsequent enforcement may require disclosure, all matters relating to the arbitration, including the award, shall be held in confidence. Regardless of arbitration requirement above, you and Samsung may enforce your and our respective intellectual property rights in any court of competent jurisdiction, including but not limited to equitable relief. </p>
          </li>
        </ol>
        
        <h2 id="samsung-simbandsamiio-research-platform-developer-license-agreement">Samsung Simband/SAMIIO Research Platform Developer License Agreement</h2>
        <p><strong>Last Updated: November 07, 2014</strong></p>
        
        <p>Thank you for your interest in the Samsung Simband/SAMIIO Platform Developer License. Samsung is offering software, development tools, hardware, specifications and other products and services for the development of products and services that are compatible with the Simband/SAMIIO Platform to you, as an individual or an authorized representative of a corporate or other entity ("you" or "your), so long as you (a) agree to be bound by this Developer License Agreement (the "Agreement"); (b) represent that you are of the legal age of majority in the jurisdiction in which you reside (at least 18 years of age in many countries); and (c) have the right and authority to enter into this agreement on your own behalf, or if you are entering into this agreement on behalf of a corporate or other entity, you have the authority to bind the entity that you represent.  "Samsung", "we", "us" or "our" means Samsung Electronics Co., Ltd., together with any affiliates that license materials for the Simband/SAMIIO Platform.</p>
        
        <ol>
          <li>
            <p><strong>How to Accept this Developer License Agreement</strong></p>
        
            <p>1.1 <strong>*Acceptance of the Agreement.</strong> The Developer Kit is available through the Simband/SAMIIO Platform and this Agreement supplements and is in addition to the Platform Terms of Service. If any terms and conditions of this Agreement conflict with the Platform Terms of Service, this Agreement will control. Please read all of these terms and conditions carefully. This Agreement is a binding legal agreement between you and Samsung. If you agree to all of the terms and conditions in this Agreement, you can accept this Agreement by clicking on the "I Agree" button, if available, or installing, copying or otherwise using the Developer Kit. If you do not agree to the terms and conditions of this Agreement, do not click on the "I Agree" button (if available) and do not install, copy or use the Developer Kit.</p>
        
            <p>1.2 <strong><em>Term of the Agreement.</em></strong> This Agreement is effective from the date of your acceptance until you or we terminate in accordance with the termination provisions of this Agreement ("Term").</p>
        
            <p>1.3 <strong><em>Changes to the Agreement.</em></strong> We may also update this Agreement from time to time, so it is important that you check back often for updates. If we think any of the changes are material, we will let you know by placing information on the Developer Kit website. The most current version of this Agreement will always be available on Samsung.com http://developer.samsungsami.io/about/terms-service.html. You can check the "effective date" posted at the top to see when this Agreement was last updated. By accessing or using our Services after we have placed such a notice, you consent to the new practice(s) identified in the update.</p>
          </li>
          <li>
            <p><strong>Other Applicable Terms and Conditions</strong></p>
        
            <p>Our Developer Kit contains some components that are proprietary to Samsung. Those components are subject to the terms and conditions of this Agreement.  Other components of our Developer Kit may be distributed to you under a separate license, including Open Source Software licenses (each separate license is a "Separate Component License").  If you use any components of the Developer Kit that are subject to a Separate Component License, you will need to agree to that Separate Component License for those components. If the terms of any Separate Component License are inconsistent with this Agreement, the Separate Component License terms will control. We will label the components of the Developer Kit, so that you will be able to identify any components subject to a Separate Component License (including the applicable Separate Component License).</p>
          </li>
          <li>
            <p><strong>Definitions</strong></p>
        
            <p>In this Agreement, when capitalized: </p>
        
            <p>"Authorized Users" means your employees or other authorized contractors or agents who have written and binding agreements with you to protect the unauthorized use and disclosure of Samsung's and other third party Confidential Information (to the extent they will have access to such Confidential Information).</p>
        
            <p>"Developer Kit" means all Platform-related hardware, software, documentation, and other materials provided to you by or on behalf of Samsung. </p>
        
            <p>"Developer Product(s)" means any software, hardware or other product or service created by you or on your behalf using the Developer Kit.</p>
        
            <p>"Open Source Software" means any software or software component, module or package that contains, or is derived in any manner (in whole or in part) from, any software that is distributed as free software, open source software or under similar licensing or distribution models, including, without limitation, software licensed or distributed under any of the following licenses or distribution models, or licenses or distribution models similar to any of the following: (a) GNU's General Public License (GPL) or Lesser/Library GPL (LGPL); (b) the Artistic License (e.g., PERL); (c) the Mozilla Public License; (d) the Netscape Public License; (e) the Sun Community Source License (SCSL); (f) the Sun Industry Standards License (SISL); (g) the BSD License; (h) the MIT License; and (i) the Apache License.</p>
        
            <p>"Platform" means the mobile health platform that is being developed by Samsung and is currently known as Simband, Simsense, and/or SAMIIO. The Platform allows you to develop both wearable and cloud-based Developer Products.</p>
        
            <p>"Third Party Software" means any software, computer programming code or accompanying documentation owned by any third party including, but not limited to, any of following:
        any software licensed from a third party, or</p>
        
            <ul>
              <li>any software placed in the public domain and accessible to anyone without any specific license terms attached thereto, or</li>
              <li>any software disclosed or distributed under a license that permits users to use, modify, improve or distribute such software and/or documentation and requires any or all of the following: 
                <ul>
                  <li>the making available of source code, object code and/or accompanying documentation of the software or any modifications to, or derivatives of, such software and/or documentation; or</li>
                  <li>the granting of the right to distribute, use, create modifications to, or create derivative works from, such software and/or documentation at no charge or on a royalty-free basis.</li>
                </ul>
              </li>
              <li>any Open Source Software.</li>
            </ul>
        
            <p>"Update(s)" means bug fixes, enhancements, modifications, new releases, new versions, supplements, updates, or upgrades to the Developer Kit.</p>
          </li>
          <li>
            <p><strong>Your Licenses to Use the Developer Kit and Its Components</strong></p>
        
            <p>4.1 Developer Kit Components.  The Developer Kit contains proprietary components (consisting of closed source components and reference source components), and Open Source Software components, as further described below:</p>
        
            <ul>
              <li>Closed Source Components. The closed source components of the Developer Kit are those Samsung-proprietary components that you may reference as you create a Developer Product, and are subject to the license granted by Samsung in Section 4.2 ("Proprietary Components").</li>
              <li>Reference Source Components. The reference source components are those Samsung-proprietary components that contain code that you may distribute along with your Developer Product, and are subject to the license granted by Samsung in Section 4.3.</li>
              <li>Open Source Software Components. The Open Source Software components or those components of the Developer Kit that Samsung is making available in accordance with the LGPL v2 license (which you may view at <a href="https://www.gnu.org/licenses/lgpl-2.1-standalone.html">https://www.gnu.org/licenses/lgpl-2.1-standalone.html</a>).</li>
            </ul>
        
            <p>A list of the components of the Developer Kit and the license associated with each component is available in Exhibit A to this Agreement. </p>
        
            <p>4.2 <strong><em>License to the Developer Kit.</em></strong> As long as you comply with the provisions of this Agreement, Samsung hereby grants you a limited, non-exclusive, personal, revocable, non-sublicensable and non-transferable license during the Term to use and reproduce the Developer Kit internally for the sole purpose of developing one or more Developer Products for use with the Platform.</p>
        
            <p>4.3 <strong><em>License to Distribute Reference Source Components.</em></strong>  You can distribute the Reference Source Components along with your Developer Product, as long as you comply with the terms and conditions in this Agreement, including but not limited to the requirements listed in subsections (a), (b) and (c) below.</p>
        
            <ul>
              <li>You may use the Developer Kit only to create Developer Products that are intended for use with the Platform.</li>
              <li>You may copy, use and distribute the Reference Source Components to distributors of your Developer Product and end users, when the Reference Source Components are used in your Developer Product. You may not modify or otherwise change the Reference Source Components.</li>
              <li>To distribute the Reference Source Components, you must (i) add significant primary functionality to the Reference Source Components as part of your Developer Product; (ii) you must include terms of use and require distributors and end users to agree to terms and conditions that are as protective of the Reference Source Components as this Agreement; (iii) display your valid copyright notice in your Developer Product; and (iv) indemnify, defend and hold harmless Samsung from any claims (including attorney's fees) related to the distribution or use of your Developer Product.</li>
            </ul>
        
            <p>4.4 <strong><em>Technical Specifications.</em></strong> Samsung may require your Developer Product to satisfy certain technical standards. In addition, if a material change is made to your Developer Product, you may be required to submit the revised version to Samsung.   </p>
        
            <p>4.5 <strong><em>Proprietary Notices.</em></strong> You must ensure that the Samsung copyright disclaimers and other proprietary notices that appear in the Developer Kit are retained and reproduced in full in all copies of the Developer Kit that you make, as permitted under this Agreement.</p>
        
            <p>4.6 <strong><em>Your Responsibilities.</em></strong> Except as otherwise allowed under this Agreement (which includes those rights to use the Developer Kit for or with your Developer Product granted to you under this Section 5), you must not, directly or indirectly, (i) sell, redistribute, rent, lease, lend or sublicense all or any part of the Developer Kit, or enable or allow others to do such things, or (ii) copy, modify, adapt, redistribute, decompile, reverse engineer, disassemble, or create derivative works of the Developer Kit or any part thereof, or enable or allow others to do such things. These restrictions apply except as prohibited by applicable law and only to the extent of that prohibition.  </p>
        
            <p>4.7 <strong><em>Limited License.</em></strong>  Except as expressly granted in this Section, Samsung does not grant you a license under any Samsung patent, copyright, trademark or other intellectual property rights.  Samsung is not granting you any right to sell, license, rent, distribute or otherwise commercialize a Developer Product under this Agreement.</p>
        
            <p>4.8 <strong><em>Use of Trademarks and Logos.</em></strong> Other than the rights we grant to you in this Agreement, you will not use any trademarks, trade dress or other marks belonging or licensed to Samsung in any way unless we authorize that use in writing. You agree that all goodwill arising out of your authorized use of Samsung's marks shall inure to the benefit of and belong to Samsung.</p>
          </li>
          <li>
            <p><strong>Our Use of Data and Developer Products</strong></p>
        
            <p>5.1 <strong><em>Our Access to Developer Products.</em></strong> During the Term, if we request access to your Developer Products, which we intend to use for Platform-development purposes, you agree to provide us with access, even if your Developer Product is incomplete.  You agree that you will not charge Samsung for access to your Developer Products – except that you will be entitled to a reimbursement at cost from Samsung if your Developer Product is hardware and we request more than two hardware units for testing and evaluation purposes.</p>
        
            <p>5.2 <strong><em>Samsung's Use of Developer Products.</em></strong>  You hereby grant Samsung and its affiliates, during the Term, a worldwide, royalty-free and fully paid up, non-exclusive license, without rights to sublicense, to use, reproduce, distribute, perform, or display Developer Products for the purpose of developing, modifying, marketing, promoting, sponsoring or otherwise commercializing the Platform.  Samsung may not sell, license or otherwise transfer the Developer Products.</p>
        
            <p>5.3 <strong><em>Collection and Use of Personal and Non-Personal Data.</em></strong></p>
        
            <ul>
              <li>Our Privacy Policy, located at <a href="www.voiceofthebody.io/privacy">www.voiceofthebody.io/privacy</a>, explains how Samsung handles your personal data and information and protects your privacy when you use the Developer Kit and Platform. By using the Developer Kit and Platform, you agree that any personal data and information that you provide to us are subject to our Privacy Policy.</li>
              <li>You agree that Samsung and its affiliates may collect and use technical and related information that is gathered periodically, including but not limited to information about your Developer Products, computer, system software, other software and peripherals. Samsung may use this information, as long as it is in a form that does not personally identify you, to improve the Developer Kit, to provide services, if any, related to the Developer Kit, verify compliance with this Agreement or for other business purposes.  You agree to obtain all consents from the users of your Developer Products necessary for Samsung to use this information.</li>
            </ul>
          </li>
          <li>
            <p><strong>Ownership of Intellectual Property</strong></p>
        
            <p>6.1 <strong><em>Samsung Intellectual Property.</em></strong> Except for the limited licenses granted to you in this Agreement, all rights, title, and interest in and to the Developer Kit, Confidential Information, Platform and any Updates that are made available to you under this Agreement, including but not limited to all related changes, improvements, derivative works and intellectual property rights ("Samsung IP") remain, at all times, the sole and exclusive property of Samsung. You agree to cooperate with Samsung to maintain Samsung's ownership of the Samsung IP, and you agree to promptly provide notice of any claims or threatened claims relating to the Samsung IP. Other than the license rights expressly set out in this Agreement, Samsung does not grant to you and you do not receive, whether by implication, estoppel or otherwise, any ownership right, title or interest nor any security interest or other interest in any intellectual property rights relating to the Developer Kit, nor in any copy of any part of the foregoing, nor any other licenses, immunity or rights, express or implied. </p>
        
            <p>6.1 <strong><em>Your Intellectual Property.</em></strong> Except for the rights granted to Samsung in this Agreement, you and your licensors retain all right, title and interest in the Developer Products.  Except for the Samsung IP, you may, subject to the terms of this Agreement, use, disclose, reproduce, distribute or otherwise exploit any ideas, suggestions or other feedback Samsung provides to you or your licensors regarding any Developer Product.</p>
          </li>
          <li>
            <p><strong>Our Rights and Obligations Under this Agreement</strong></p>
        
            <p>7.1 <strong><em>Updates and Maintenance.</em></strong> Samsung expects to support and improve the Platform and Developer Kit over time.  In order to do this, we may extend, enhance, or otherwise modify the Developer Kit, with or without notice. If Samsung makes any Updates available, those Updates will be governed by this Agreement—except that if a separate license is provided with the Update, then the terms of that license will govern the Update. Any updates may have APIs, features, services and/or functionality that are different from those found in the Developer Kit licensed under this Agreement. You are solely responsible for ensuring that your Developer Product functions properly after any such Update.  You acknowledge that we have no obligation to provide any maintenance, technical or other support in respect of the Developer Kit.</p>
        
            <p>7.2 <strong><em>Development of the Platform.</em></strong> You understand and agree that:</p>
        
            <ul>
              <li>The Platform is in the early stages of development;</li>
              <li>Samsung may change the name of the Platform (or its parts);</li>
              <li>Samsung may decide whether to and how to develop and promote the Platform; </li>
              <li>The Platform may not support the commercialization of any Developer Product;</li>
              <li>Samsung may choose not to use, accept, certify or otherwise support any Developer Product; and</li>
              <li>Samsung will not be liable for its actions or omissions relating to the implementation of the Platform.  </li>
            </ul>
        
            <p>7.3 <strong><em>Test Kits.</em></strong> From time to time, we may offer you test versions of the Developer Kit. You acknowledge and agree that you must not rely on such test versions to perform in the same manner as a final-release commercial-grade product and you should not use such test versions with data that is not sufficiently backed up on a regular basis. </p>
        
            <p>7.4 <strong><em>Rejection of Developer Products.</em></strong>  We may reject your Developer Product any time and for any reason, including but not limited to our determination that the Developer Product is inappropriate or violates this Agreement or violates any applicable law or regulation. Samsung may choose to test a Developer Product, but testing of a Developer Product does not mean that Samsung has approved the Developer Product or any aspect of the Developer Product.</p>
          </li>
          <li>
            <p><strong>Your Obligations for Use of the Platform or Developer Kit</strong></p>
        
            <p>8.1 <strong><em>Your Representations and Warranties.</em></strong>  You represent and warrant to Samsung that:</p>
        
            <ul>
              <li>(i) you have the requisite legal, and if applicable, corporate authority to enter into this Agreement and perform your obligations under this Agreement, and this Agreement does not conflict with any other agreement or obligation by which you are bound; (ii) you are and will be responsible for your Authorized Users' use of the Platform and Developer Kit and their compliance with this Agreement;  and (iii) you will be solely responsible for all activities you and your Authorized Users undertake in connection with the Platform, the Developer Kit, the Developer Products and the development of Developer Products.</li>
              <li>your Developer Product: (i) is free from material errors and defects; (ii) has been designed and developed for installation and operation solely on devices that you have fully tested and approved; and (iii) will operate with the Platform.</li>
              <li>use of your Developer Product does not and will not infringe the intellectual property rights, or other proprietary rights of any third party, and Samsung's use of any of these products, materials or services does not and will not infringe any proprietary rights of any third party, and you shall immediately notify Samsung in the event of any such infringement.</li>
              <li>your Developer Product does not, and will not when delivered or provided, contain any computer code designed to disrupt, disable, harm, or otherwise impede in any manner the operation thereof, or any other associated software, firmware, hardware, computer system or network (sometimes referred to as "viruses" or "worms"), and you have taken reasonable steps to test for, and have found no such viruses or worms.</li>
            </ul>
        
            <p>8.2 <strong><em>General Conditions and Requirements.</em></strong> You acknowledge and agree that your Developer Products must comply with the conditions and requirements set out below:</p>
        
            <ul>
              <li>You will not, through use of the Developer Kit or otherwise, create any Developer Product or other program that would disable, hack or otherwise interfere with any security, digital signing, digital rights management, content protection, verification or authentication mechanisms implemented in or through the Platform, this Developer Kit, or other Samsung software, services or technology, or enable others to do so.</li>
              <li>You (i) will comply with all applicable legal and regulatory requirements; (ii) will comply with all applicable laws and regulations of any jurisdiction in which the Developer Products are offered or made available, including all regulatory and legal requirements applicable to the creation, testing, and use of any Developer Product (or any component of the Developer Product); and (iii) are solely responsible for obtaining all required and necessary permissions and/or approvals from relevant government or regulatory authorities. </li>
              <li>You will ensure that any Developer Product introduced into interstate commerce, as of the date of that introduction, is not adulterated or misbranded within the meaning of the Federal Food, Drug, and Cosmetic Act, and is not an article which may not, under the provisions of section 404, 505, or 512 of the Federal Food, Drug, and Cosmetic Act, be introduced into interstate commerce.  </li>
              <li>If the Developer Product may collect, transmit, maintain, process, share, disclose or otherwise use personal information, location information, health information or other data that relates to a user ("User Information Handling"), you must comply, and the Developer Product must be compliant, with all applicable privacy and data collection laws and regulations with respect to such User Information Handling. Applicable laws and regulations may include the privacy and security regulations promulgated under the Health Insurance Portability and Accountability Act ("HIPAA"). You must ensure that any processing or transmission of user data is conducted in a manner that preserves the accuracy and security of the data. If your Developer Product engages in User Information Handling, you are required to maintain a privacy policy and inform the users of your Developer Product of your privacy policy. Your privacy policy must (i) comply with applicable laws and regulations, (ii) inform users of the information collected by your Developer Product and how that information is used, stored, secured and disclosed, and (iii) describe the controls that users have over the use and sharing of their information, and how they may access their information. Additional minimum requirements for your privacy policy are set forth in Exhibit B.</li>
              <li>You must not design or market Developer Products for the purpose of violating any legal rights of any person (including but not limited to privacy rights). </li>
              <li>In addition, and without limiting your obligations to follow all applicable laws and regulations, you must ensure that any Developer Product that offers health information or location information based services or functionality notifies and obtains consent from an individual before the individual's health or location data is collected, transmitted or otherwise used by the Developer Product. In addition, Developer Products that use health information based APIs shall comply with any registration process that we may implement. </li>
              <li>If a Developer Product captures, collects or records any form of user or device data, images, pictures or voice data (collectively "Recordings"), or processes, maintains, uploads, syncs, or transmits any form of user data, content or information (collectively "Transmissions"), such Recordings and Transmissions must comply with all applicable laws and regulations (including but not limited to privacy laws) as well as any policies or requirements that Samsung may provide to you. In particular, you must ensure that a reasonably distinctive and conspicuous visual or audio indication that a Recording is taking place is displayed or played to the user as part of the Developer Product.</li>
              <li>You will be solely responsible for any and all claims and/or damages arising from or related to the download or use of interpreted code in any Developer Product, other than the code that is interpreted and run by the documented Application Programming Interface(s) and built-in interpreters contained in the Developer Kit, except as authorized otherwise by Samsung in advance in writing.</li>
              <li>If your Developer Products use location-based APIs for real-time route guidance, you must have an end user license agreement that includes the following notice: "REAL TIME LOCATION DATA ACCESSED VIA THIS DEVELOPER PRODUCT MAY BE INACCURATE OR INCOMPLETE. YOUR USE OF THIS DEVELOPER PRODUCT IS AT YOUR SOLE RISK." You shall not use the Developer Product for life support devices or other devices that may cause deaths, injuries or severe physical or environmental losses. Any attempt to do so shall be deemed as a material breach under this Agreement.</li>
              <li>Developer Products must not disable, override or otherwise interfere with any Samsung-implemented system including, but not limited to, those that are intended to notify a user that the user's location data is being collected, transmitted, maintained, processed or used, or intended to obtain consent for such use. Developer Products may not provide services for which the user's consent has been denied or withdrawn.</li>
              <li>If a Developer Product includes any Third Party Software, you must comply with all licensing terms applicable to such Third Party Software. However, you shall separate the Third Party Software from Developer Kit in your Developer Product and shall not cause any part of the Developer Kit in your Developer Product, any derivative works thereof, and/or Samsung's Confidential Information to be subject to the licensing terms applicable to such Third Party Software (e.g., public disclosure, public distribution). You shall indemnify, defend and hold harmless Samsung, its distributors and its customers from and against any and all claims, demands, damages, costs or expenses (including reasonable attorney's fees) and liabilities arising out of or in relation to the use of Third Party Software.</li>
              <li>If your Developer Product includes any Open Source Software, (i) you are responsible for compliance with all applicable Open Source Software license terms, including any source code availability requirements, and (ii) your Developer Product must not cause any non-Open Source Software (including Samsung-proprietary software) to become subject to the terms of any Open Source Software license.</li>
              <li>You will promptly respond to Samsung regarding the use of policies and APIs in connection with the Developer Product and/or Developer Kit, upon Samsung's request. </li>
              <li>You will not attempt to hide or obscure any features, functionality or content in your Developer Product.</li>
              <li>You will not exploit the Developer Kit in any unauthorized manner.</li>
              <li>Your end user terms and conditions must meet the minimum requirements and include the minimum terms and conditions attached as Exhibit C. </li>
            </ul>
          </li>
          <li>
            <p><strong>Confidentiality</strong></p>
        
            <p>9.1 <strong><em>Confidential Information.</em></strong> You acknowledge and agree that the any information you receive from Samsung that is designated as confidential, or that would be reasonably understood to be confidential constitutes "Confidential Information" for the purposes of this Agreement. Notwithstanding the foregoing, Confidential Information does not include information that you can demonstrate by written evidence: (i) is generally and legitimately available to the public through no fault or breach by you, (ii) that Samsung has generally made available to the public, (iii) that you independently developed without use or reliance of any Confidential Information, (iv) that you lawfully obtained from a third party who has the right to transfer or disclose the information to you without limitation, or (v) any Open Source Software included in the Developer Kit, the licensing terms of which do not contain obligations of confidentiality.</p>
        
            <p>9.2 <strong><em>Use and Protections of Confidential Information.</em></strong> You must protect Confidential Information using a degree of care that is no less than that which you use to protect your own confidential information of the same or similar importance (and in any event, no less than a reasonable degree of care). You may use Confidential Information solely for the purpose of exercising your rights and performing your obligations under this Agreement and you must not use Confidential Information for any other purpose, or for your own or any third party's benefit, without the prior written consent of Samsung. You may disclose Confidential Information to the extent required by law, as long as you take reasonable steps to notify Samsung of the relevant requirement before disclosing the Confidential Information and you take reasonable steps to obtain protective treatment against disclosure of the Confidential Information. You acknowledge that any disclosure, use or misappropriation of Confidential Information of Samsung in violation of this Agreement would cause Samsung irreparable harm for which there may be no adequate remedy at law. Accordingly, you agree that Samsung shall have the right to apply to any court of competent jurisdiction for injunctive relief and specific performance, without prejudice to any remedies otherwise available to Samsung at law or in equity.</p>
        
            <p>9.3 <strong><em>Your Disclosures.</em></strong>  Samsung works with many application and software developers and some of their products may be similar to or compete with your Developer Products. Samsung may also be developing its own similar or competing applications and products or may decide to do so in the future. To avoid potential misunderstandings, Samsung cannot agree, and expressly disclaims, any confidentiality obligations or use restrictions, express or implied, with respect to any information that you may provide in connection with this Agreement, including information about your Developer Product (such disclosures will be referred to as "Disclosures"). You agree that any such Disclosures will be non-confidential. Samsung will be free to use and disclose any Disclosures on an unrestricted basis without notifying or compensating you. You release Samsung from all liability and obligations that may arise from the receipt, review, use, or disclosure of any portion of any Disclosures. Any physical materials you submit to Samsung will become Samsung property and Samsung will have no obligation to return those materials to you or to certify their destruction. </p>
          </li>
          <li>
            <p><strong>DISCLAIMER OF WARRANTY</strong></p>
        
            <p>ALL PLATFORM AND DEVELOPER KIT MATERIALS OR RELATED SERVICES FROM SAMSUNG ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS, AND SAMSUNG MAKES NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY WITH RESPECT TO THE PLATFORM OR DEVELOPER KIT MATERIALS, UPDATES OR ANY RELATED SERVICES AND SAMSUNG EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES AND CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE OR NON-INFRINGEMENT.  YOUR USE OF THE PLATFORM OR DEVELOPER KIT, INCLUDING ANY UPDATES OR RELATED SERVICES, IS AT YOUR OWN DISCRETION AND RISK, AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE THAT RESULTS FROM THE USE OF THE PLATFORM, DEVELOPER KIT MATERIALS, INCLUDING ANY UPDATES, OR RELATED SERVICES INCLUDING, BUT NOT LIMITED TO, ANY DAMAGE TO YOUR COMPUTER SYSTEM, HARDWARE, SOFTWARE OR LOSS OF DATA. FOR THE PURPOSE OF CLARITY, THE PLATFORM AND DEVELOPER KIT, INCLUDING UPDATES OR RELATED SERVICES, ARE LICENSED "AS-IS" AND YOU BEAR THE RISK OF USING IT. SAMSUNG GIVES NO EXPRESS AND/OR IMPLIED WARRANTIES, GUARANTEE OR CONDITIONS. </p>
          </li>
          <li>
            <p><strong>LIMITATION OF LIABILITY</strong></p>
        
            <p>SUBJECT TO TERMS AND CONDITIONS OF THIS AGREEMENT AND TO THE FULLEST EXTENT ALLOWED AND PERMITTED BY APPLICABLE LAWS AND REGULATIONS, SAMSUNG SHALL NOT, UNDER ANY CIRCUMSTANCES, BE LIABLE TO YOU OR ANY THIRD PARTY THROUGH YOU FOR PERSONAL INJURY OR ANY CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, INDIRECT, PUNITIVE OR SPECIAL DAMAGES WHATSOEVER, INCLUDING, WITHOUT LIMITATION, DAMAGES FOR DELAY OF DELIVERY, LOSS OF PROFITS, LOSS OF DATA, LOSS OF GOODWILL, BUSINESS INTERRUPTION OR ANY OTHER COMMERCIAL DAMAGES OR LOSSES, ARISING OUT OF OR IN RELATION TO THIS AGREEMENT, YOUR USE OF THE DEVELOPER KIT, PLATFORM OR OTHER PRODUCTS OR SERVICES PROVIDED BY SAMSUNG UNDER THIS AGREEMENT, OR YOUR DEVELOPMENT OF DEVELOPER PRODUCTS, WHETHER BASED ON BREACH OF CONTRACT, BREACH OF WARRANTY, TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY OR OTHERWISE, EVEN IF SAMSUNG HAS BEEN ADVISED OF OR IS AWARE OF THE POSSIBILITY OF SUCH DAMAGES AND NOTWITHSTANDING THE FAILURE OF ESSENTIAL PURPOSE OF ANY REMEDY. YOUR UNDERSTANDING, ACKNOWLEDGEMENT AND ACCEPTANCE OF THIS AGREEMENT ARE THE LEGAL BASIS AND CONSIDERATION FOR THE LICENSES GRANTED UNDER IT.  In no event shall Samsung's total liability to you under this Agreement for all damages (other than as may be required by applicable law in cases involving personal injury) exceed the greater of the amount paid to Samsung for the Developer Kit or the amount of fifty dollars ($50.00).</p>
          </li>
          <li>
            <p><strong>Indemnity</strong></p>
        
            <p>12.1 To the fullest extent permitted by law, you agree to indemnify, defend and hold harmless Samsung, its affiliates, directors, officers, employees, independent contractors and agents (each a "Samsung Indemnified Party") from any and all claims, losses, liabilities, damages, expenses and costs (including without limitation reasonable attorneys' fees) (collectively "Losses") incurred by a Samsung Indemnified Party as a result of your (or your Authorized User's) breach of this Agreement, any claims that your Developer Product violates or infringes any third party intellectual property or proprietary rights, or otherwise related to or arising from your (or any Authorized User's) use of the Developer Kit, Platform, other products and services provided by Samsung under this Agreement or your Developer Product or your (or any Authorized User's) development or distribution of any Developer Product (each a "Claim").</p>
        
            <p>12.2 You acknowledge that the Developer Kit is not intended to be used in the development of any Developer Product where death, personal injury, or severe physical or environmental damage could result from errors or inaccuracies in the content, data or information provided by the Developer Product or by Developer Product failures. To the extent permitted by law, you agree to indemnify, defend and hold harmless each Samsung Indemnified Party from any Losses incurred by such Samsung Indemnified Party as a result of your use of the Developer Kit in the development of any such Developer Products. </p>
        
            <p>12.3 You must not enter into a settlement or like agreement with any third party that affects Samsung's rights or binds Samsung in any way related to or arising from your (or your Authorized User's) use of the Developer Kit without the prior written consent of Samsung.</p>
          </li>
          <li>
            <p><strong>How This Agreement May Be Terminated</strong>*</p>
        
            <p>13.1 <strong><em>Right to Terminate.</em></strong> (a) You can terminate this Agreement immediately by stopping your use of the Developer Kit; and (b) Samsung can terminate this Agreement immediately, (i) if you have or we believe that you have breached any terms of this Agreement; (ii) if we are required by law to terminate this Agreement or the rights granted by Samsung; or (iii) if we stop providing the Developer Kit or Platform for any reason.</p>
        
            <p>13.2 <strong><em>What Happens when this Agreement Terminates.</em></strong>  As long as we terminate this Agreement following the procedures in this Agreement, Samsung will have no liability to pay compensation or damages, or to provide an indemnity of any kind as a result of terminating this Agreement, and termination of this Agreement is without prejudice to any other right or remedy that Samsung may have, now or at any time in the future.  When this Agreement expires or terminates: (a) all rights granted to you in this Agreement will terminate; (b) you will immediately stop using the Developer Kit and return the Developer Kit to Samsung or destroy all electronic copies of the Developer Kit, and if Samsung requests you do so, provide written certification of such destruction to Samsung. The provisions of Sections Definitions, 2.3, 3, 5.1, 5.2, 6, 7, 8, 9, 10.2 and 11 will survive the expiration or termination of this Agreement. Termination of this Agreement will be without prejudice to any other right or remedy Samsung may have now or in the future.</p>
          </li>
          <li>
            <p><strong>General</strong></p>
        
            <p>14.1 <strong><em>Assignment.</em></strong> You may not assign the Agreement, in whole or in part, without Samsung's prior written consent. Any attempt to do so without such consent shall be void. Samsung may assign this Agreement without your consent. This Agreement shall be binding upon and shall inure to the benefit of the parties hereto and their respective successors and permitted assigns.</p>
        
            <p>14.2 <strong><em>Relationship Between You and Samsung; Third Party Rights.</em></strong> This Agreement will not be construed as creating an agency, partnership, joint venture, fiduciary duty, or any other form of legal relationship between you and Samsung, and you must not represent the existence of any such relationship, whether expressly, by implication or otherwise. This Agreement is not for the benefit of any third parties.</p>
        
            <p>14.3 <strong><em>Development by Samsung.</em></strong> Nothing in this Agreement limits or otherwise affects Samsung's right to acquire, develop, license, market, promote, or distribute any product or technology that performs the same or similar functions as the Developer Products or any other products or technologies that you develop, market, promote or distribute, or that otherwise competes with the Developer Products or such products or technologies.</p>
        
            <p>14.4 <strong><em>Notices.</em></strong>  Any notices or other communication made pursuant to this Agreement must be in writing and will be deemed to have been fully given or made when: (a) personally delivered; or (b) three (3) days after being mailed via commercially reputable overnight delivery service, to the following address:</p>
        
            <p> Developer Relations
         SAMIIO<br />
         Samsung Electronics Co., Ltd. 2440 <br />
        Sand Hill Road, <br />
        Suite 302 <br />
        Menlo Park, CA 94025 </p>
        
            <p>You agree to receive notices and other communications to be made to you pursuant to this Agreement by email and you agree that any notices that Samsung sends to you by email will satisfy any legal communication requirements. </p>
        
            <p>A party may change its email or mailing address by giving the other party written notice in accordance with this section.</p>
        
            <p>14.5 <strong><em>Severability.</em></strong> If a court of competent jurisdiction finds any provision of this Agreement to be unenforceable for any reason, that provision of this Agreement shall be enforced to the maximum extent permissible so as to effect the intent of the parties, and the remainder of this Agreement shall continue in full force and effect. However, if applicable law prohibits or restricts you from fully and specifically complying with the Sections of this Agreement entitled "Grant of Developer License and Restrictions" or "Licensee's Responsibilities" or prevents the enforceability of either of those Sections, this Agreement will immediately terminate and you must immediately discontinue any use of the Developer Kit as described in the Section entitled "Termination."</p>
        
            <p>14.6 <strong><em>No Waiver; Construction.</em></strong> Failure by Samsung to insist upon strict performance of any of the provisions contained in this Agreement shall in no way constitute a waiver of Samsung's rights as set forth in this Agreement, at law or in equity, or a waiver of any other provisions or the right to take action in respect of a subsequent default by you in the performance or compliance with any of the terms and conditions set forth in this Agreement. Any laws or regulations that provide that the language of a contract will be construed against the drafter will not apply to this Agreement. Section headings are for convenience only and are not to be considered in construing or interpreting this Agreement.</p>
        
            <p>14.7 <strong><em>Export Control.</em></strong> You may not use, export, re-export, import, sell or transfer the Developer Kit except as authorized by United States law, the laws of the jurisdiction in which you obtained the Developer Kit, and any other applicable laws and regulations. In particular, but without limitation, the Developer Kit may not be exported or re-exported (a) into any U.S. embargoed countries or (b) to anyone on the U.S. Treasury Department's list of Specially Designated Nationals or the U.S. Department of Commerce Denied Person's List or Entity List. By using the Developer Kit, you represent and warrant that you are not located in any such country or on any such list. You also agree that you will not use the Developer Kit for any purposes prohibited by United States law, including, without limitation, the development, design, manufacture or production of nuclear, chemical or biological weapons.</p>
        
            <p>14.8 <strong><em>US Government End Users.</em></strong> The Developer Kit is a "Commercial Item", as that term is defined at 48 C.F.R. § 2.101, consisting of "Commercial Computer Software" and "Commercial Computer Software Documentation", as such terms are used in 48 C.F.R. § 12.212 or 48 C.F.R. § 227.7202, as applicable. Consistent with 48 C.F.R. § 12.212 or 48 C.F.R. § 227.7202-1 through 227.7202-4, as applicable, the Commercial Computer Software and Commercial Computer Software Documentation are being licensed to U.S. Government end users (a) only as Commercial Items and (b) with only those rights as are granted to all other end users pursuant to the terms and conditions herein. Unpublished-rights are reserved under the copyright laws of the United States.</p>
        
            <p>14.9 <strong><em>Governing Law; Venue.</em></strong></p>
        
            <ul>
              <li>This Agreement shall be governed by and construed in accordance with the laws of the State of California, USA, without regard to any conflict-of-laws rules. All disputes, controversies or claims between the parties arising out of or in connection with this Agreement (including its existence, validity or termination) shall be finally resolved by arbitration to be held in Santa Clara, California and conducted in English under the Rules of Arbitration of the International Chamber of Commerce; provided, however, that each party may enforce its or its affiliates' intellectual property rights in any court of competent jurisdiction, including but not limited to equitable relief. The arbitral award shall be final and binding on the parties. Except to the extent entry of judgment and any subsequent enforcement may require disclosure, all matters relating to the arbitration, including the award, shall be held in confidence.</li>
              <li>Notwithstanding the foregoing, if you are an agency, instrumentality or department of the federal government of the United States, then this Agreement shall be governed in accordance with the laws of the United States of America, and in the absence of applicable federal law, the laws of the State of California, USA will apply. Further, and notwithstanding anything to the contrary in this Agreement (including but not limited to Section 8 (Indemnity)), all claims, demands, complaints and disputes will be subject to the Contract Disputes Act (41 U.S.C. §§ 601-613), the Tucker Act (28 U.S.C. § 1346(a) and § 1491), or the Federal Tort Claims Act (28 U.S.C. §§ 1346(b), 2401-2402, 2671-2672, 2674-2680), as applicable, or other applicable governing authority.</li>
              <li>If you (as an entity entering into this Agreement) are a U.S. public and accredited educational institution, then (a) this Agreement will be governed and construed in accordance with the laws of the state (within the U.S.) in which Licensee's educational institution is domiciled, except that body of state law concerning conflicts of law; and (b) any litigation or other dispute resolution between Licensee and Samsung arising out of or relating to this Agreement, the Developer Kit, or your relationship with Samsung will take place in federal court within the Northern District of California, and Licensee and Samsung hereby consent to the personal jurisdiction of and exclusive venue of such District unless such consent is expressly prohibited by the laws of the state in which Licensee's educational institution is domiciled.</li>
              <li>This Agreement shall not be governed by the United Nations Convention on Contracts for the International Sale of Goods, the application of which is expressly excluded.</li>
            </ul>
        
            <p>14.10 <strong><em>Entire Agreement; Governing Language.</em></strong> This Agreement contains the entire agreement between the parties with respect to the use of the Developer Kit licensed hereunder and supersedes all existing agreements and all other oral, written or other communications between the parties concerning this subject matter. If any provision of this Agreement (or any portion thereof) is invalid, illegal or unenforceable, the validity, legality and enforceability of the remainder of this Agreement shall not be affected or impaired. If we provide any translation of this Agreement to fulfill local requirements and there is a dispute between the English and any non-English version, the English version of this Agreement governs. </p>
          </li>
        </ol>
        
        <h3 id="exhibit-a">EXHIBIT A</h3>
        
        <h3 id="developer-kit-components">Developer Kit Components</h3>
        
        <p>The table below lists the components of the Developer Kit along with the applicable license that applies to the component.</p>
        
        <table>
          <thead>
            <tr>
              <th>Component</th>
              <th>License</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>M4 Algorithms:</td>
              <td>LGPLv2 (<a href="https://www.gnu.org/licenses/lgpl-2.1-standalone.html">https://www.gnu.org/licenses/lgpl-2.1-standalone.html</a>)</td>
            </tr>
            <tr>
              <td>M4 framework</td>
              <td>LGPLv2 (<a href="https://www.gnu.org/licenses/lgpl-2.1-standalone.html">https://www.gnu.org/licenses/lgpl-2.1-standalone.html</a>)</td>
            </tr>
            <tr>
              <td>M4 SSIC Algorithms</td>
              <td>Closed Source Component(1)</td>
            </tr>
            <tr>
              <td>M0 software:</td>
              <td>Reference Source Component(2)</td>
            </tr>
            <tr>
              <td>Simband Apps on Tizen:</td>
              <td>Reference Source Component(2)</td>
            </tr>
            <tr>
              <td>Simband framework on Tizen:</td>
              <td>Reference Source Component(2)</td>
            </tr>
            <tr>
              <td>Simband services on Tizen</td>
              <td>Reference Source Component(2)</td>
            </tr>
          </tbody>
        </table>
        
        <ol>
          <li>See Section 4.2 of this Agreement for the applicable license. </li>
          <li>See Section 4.3 of this Agreement for the applicable license.</li>
        </ol>
        
        <h3 id="exhibit-b">EXHIBIT B</h3>
        
        <h4 id="minimum-privacy-policy-terms-and-conditions">Minimum Privacy Policy Terms and Conditions</h4>
        
        <p>As provided in Section 8.2(d) of the Agreement, if a Developer Product engages in User Information Handling, your privacy policy for the Developer Product shall be clearly and conspicuously posted and shall include provisions notifying users of the following:</p>
        
        <ol>
          <li>The categories of personally identifiable information ("Personal Information") collected by your Developer Product;</li>
          <li>The categories of third parties or persons with which you may share Personal Information;</li>
          <li>How you use and disclose Personal Information;</li>
          <li>The controls that users have with respect to use and disclosure of Personal Information;</li>
          <li>A general description of the security measures that you employ to safeguard Personal Information;</li>
          <li>If you maintain a process for a user of the Developer Product to review and request changes to his or her Personal Information, a description of that process;</li>
          <li>The process by which you notify users of material changes to the privacy policy;</li>
          <li>The effective date of the current version of the privacy policy;</li>
          <li>Whether you respond to Web browser "do not track" signals or other mechanisms that provide users the ability to exercise choice regarding the collection of Personal Information;</li>
          <li>How you or other parties may collect Personal Information about a user's online activities over time and across different websites when a consumer uses the Developer Product; and</li>
          <li>If you will disclose Personal Information to third parties, you will obtain reasonable user consent to such disclosure.</li>
        </ol>
        
        <h3 id="exhibit-c">EXHIBIT C</h3>
        
        <h4 id="minimum-end-user-terms-and-conditions">Minimum End User Terms and Conditions</h4>
        
        <p>As provided in Section 8.2(p) of the Agreement, if a Developer Product is expected to be made available to end users through the Platform, your End User License Agreement ("EULA") will include the following minimum terms and conditions. </p>
        
        <p>Your EULA must:</p>
        
        <ol>
          <li>Comply with all applicable laws in all countries where end users will purchase or download a Developer Product.</li>
          <li>Provide that you and your end use will acknowledge that the EULA for your Developer Product is solely between you and your end user and Samsung will not be responsible for, and Samsung will not have any liability whatsoever under any EULA for any breach by you or any end user of any terms and conditions of your EULA.</li>
          <li>Provide for usage rules for Developer Products that are at least as restrictive as any usage rules provided by Samsung through the Platform or the accompanying website.</li>
          <li>Inform your end users and require your end users to acknowledge that you are solely responsible for providing any maintenance and support services for your Developer Product, and that Samsung has no obligation whatsoever to provide any maintenance or support services for your Developer Product.</li>
          <li>Make you solely responsible for any product warranties. The EULA must also provide that, if the Developer Product does not conform to any applicable warranty, to the maximum extent permissible by law, Samsung will have no warranty obligation whatsoever with respect to the Developer Product, and any other claims, losses, liabilities, damages, costs or expenses attributable to any failure to conform to any warranty will be your sole responsibility.</li>
          <li>Provide that you, not Samsung, are responsible for addressing any claims of any end user or any third party relating to or arising from the Developer Product or end user's possession or use of such Developer Product, including but not limited to any claims that the Developer product infringes any third party's intellectual property rights, claims arising under any consumer protection, FDA or any other legal or regulatory requirement.</li>
          <li>Require the end user to represent and warrant that such end user is not located in a country that is subject to a U.S. Government embargo, or that has been designated by the U.S. Government as a "terrorist supporting" country, and that such end user is not listed on any U.S. Government list of prohibited or restricted parties.</li>
          <li>Provide your name, address and contact information (telephone number and email address) for end users to contact you with questions, complaints and/or claims with regard to the Developer Product.</li>
          <li>Provide that Samsung and its affiliates are third party beneficiaries of your EULA, and upon the end user's acceptance of the terms and conditions of the EULA, Samsung will have the right (and be deemed to have accepted the right) to enforce the EULA against the end user as a third party beneficiary.</li>
        </ol>
        
        <p>In addition, you acknowledge and agree to the following terms and conditions.</p>
        
        <ol>
          <li>Allow your end users to review your EULA before or at the time your Developer Product is delivered to your end user.</li>
          <li>Allow us to notify your end uses that their use of your Developer Product is subject to the terms and conditions of your Developer Product.</li>
          <li>Agree that if you do not furnish a EULA for your end users, each end user's use of your Developer Product is subject to our standard EULA.</li>
        </ol>
        <div className="trials-policy"> 
          <h2 id="samsungtrial-administrator-toolterms-of-service">Samsung  Trial Administrator Tool Terms of Service</h2>
          
          <p><strong>Last Updated: November 07, 2014</strong></p>
          
          <p>Welcome to the Samsung Trial Administrator Tool. Samsung Electronics Co., Ltd. and/or its subsidiaries and affiliates (collectively, "Samsung", "we", "us" or "our") provides the Trial Administrator Tool and related features, software, tools, and other products and services (the "Trial Tool") to you ("you", "your" or "Users") for the purpose of conducting user trials. If you are using the Trial Tool on behalf of an organization, you agree to these Trial Administrator Tool Terms of Service ("Trial Tool Terms") for that organization and you represent and warrant that you have the authority to bind that organization to these Trial Tool Terms (in which case, "you", "your" and "User" will refer to that organization).</p>
          
          <p>The Samsung Trial Tool is available through the SAMIIO Platform (the "Platform"), and these Trial Tool Terms supplement and are in addition to the Platform Terms of Service. If any of these Trial Tool Terms conflict with or are inconsistent with the Samsung SAMIIO Platform Terms of Service, these Trial Tool Terms will control.</p>
          
          <p><strong><em>Please read these Trial Tool Terms carefully. They are a legal agreement between you and us that governs your use of the Trial Tool. By using the Trial Tool, you are agreeing to these Trial Tool Terms.  If you do not agree to these Trial Tool Terms, do not use the Trial Tool.</em></strong></p>
          
          <ol>
            <li>
              <p><strong><em>You Retain Ownership of your Content.</em></strong> You retain ownership of the information, materials, documents, media files or other data or content that you upload, transmit, create, post, display or otherwise provide on or through the Trial Tool ("Trial Tool Content").  Other than the rights you grant to Samsung under these Trial Tool Terms, Samsung does not claim ownership of or any other rights to your Trial Tool Content, and you retain ownership of any intellectual property rights that you hold in your Trial Tool Content. In other words, the Trial Tool Content that belongs to you remains yours.</p>
            </li>
            <li>
              <p><strong><em>Privacy and Protection of your Personal Data.</em></strong></p>
          
              <p>2.1 Our Privacy Policy, located at www.voiceofthebody.io/privacy, explains how Samsung handles your personal data and information and protects your privacy when you use the Trial Tool. By using the Trial Tool, you agree that your personal data and information are subject to our Privacy Policy.</p>
            </li>
            <li>
              <p><strong><em>Closing Your Account.</em></strong></p>
          
              <p>3.1. You may close your account at any time.</p>
          
              <p>3.2 Samsung may also disable or terminate your account at any time and without notice if:</p>
          
              <ul>
                <li>We believe tha3t you are in breach of these Trial Tool Terms;</li>
                <li>You have demonstrated (whether directly or through your actions or statements or otherwise) that you do not intend to comply with these Trial Tool Terms;</li>
                <li>We or any of our suppliers or partners believe that that it's a requirement of any applicable law or regulation to stop providing the Trial Tool or any parts of the Trial Tool; or</li>
                <li>We decide to stop providing the Trial Tool.</li>
              </ul>
          
              <p>3.3 Terminating this Agreement will not prejudice any rights, obligations and liabilities that you or Samsung have accrued or incurred while these Trial Tool Terms were in effect.</p>
          
              <p>3.4 If Samsung disables access to your account, you may not be able to access or use the Trial Tool, your account details or any files, including your Trial Tool Content or Third Party Products that are stored with your account.  Samsung may allow you to backup your Trial Tool Content stored with Samsung through the use of the Trial Tool.  You understand that Samsung may delete your Trial Tool Content or may retain your Trial Tool Content indefinitely. </p>
            </li>
            <li>
              <p>Use of the Trial Tool; Limitations on Use of the Trial Tool.</p>
          
              <p>4.1 During the term of these Trial Tool Terms, unless otherwise specified in these Trial Tool Terms, Samsung grants you a personal, non-exclusive, non-transferable right to use the Trial Tool for internal business purposes only. You may not (a) reproduce, duplicate, copy, sell, trade or resell the Trial Tool or parts of the Trial Tool, (b) remove any proprietary notice language corresponding to the Trial Tool, or (c) make modifications to any of the Trial Tool.</p>
          
              <p>4.2 You agree (a) to comply with and meet all applicable legal and regulatory requirements, applicable privacy and data collection laws and regulations; and (b) to comply with the laws and regulations of any place in which you conduct studies using the Trial Tool, including but not limited to obtaining all required and necessary permissions and/or approvals from relevant government or regulatory authorities.</p>
          
              <p>4.3 Any personal information, location information, health information or other data that relates to a person participating in your trial that you may collect, transmit, maintain, process, share, disclose or otherwise use ("Trial Participant Information") may be subject to various laws and regulatory requirements including, but not limited to, requirements imposed by the U.S. Food and Drug Administration ("FDA"), and privacy and security regulations promulgated under the Health Insurance Portability and Accountability Act ("HIPAA"). You must ensure that any processing or transmission of the Trial Participant Information is conducted in a manner that preserves the accuracy and security of the data. You also agree to maintain a privacy policy. You are responsible for informing all trial participants of your privacy policy. Your privacy policy is required to (i) comply with applicable laws and regulations, (ii) inform users of the information collected by you and how that information is used, stored, secured and disclosed, and (iii) describe the controls that trial participants have over the use and sharing of their information, and how they may access their information.   </p>
          
              <p>4.4 You must not use the Trial Tool to violate any legal rights of any person (including but not limited to privacy rights). </p>
          
              <p>4.5 You understand and acknowledge that the FDA and other governmental authorities have certain requirements that must be met in order to conduct studies using persons ("Clinical Studies"), including, without limitation, Clinical Studies utilizing hardware, software, or algorithms that FDA considers to be "devices" under the Federal Food, Drug, and Cosmetic Act.  Clinical Studies may be subject to various requirements under the applicable federal, state, and local laws, rules, and regulations ("Applicable Laws").  </p>
          
              <p>4.6 You are solely responsible for ensuring that any Clinical Study you conduct or that is conducted on your behalf that utilizes the Platform or the Trial Tool in any manner (a "Trial Administrator Clinical Study") is conducted in compliance with all Applicable Laws, including, but not limited to, the Federal Food, Drug, and Cosmetic Act; 21 C.F.R. Parts 50, 56, and 812; and Chapter 1.3 of Division 20 of the California Health &amp; Safety Code (Human Experimentation).  You will obtain all approvals, clearances, exemptions, and other authorizations required under the Applicable Laws for a Trial Administrator Clinical Study, including, without limitation, any required FDA or an Institutional Review Board ("IRB"), exemption or approval, (collectively, "Study Approvals") before you begin any Trial Administrator Clinical Study.  You will make sure that your use of the Platform or the Trial Tool in any Trial Administrator Clinical Study is consistent with the Applicable Laws and Study Approvals, including obtaining written informed consent from study subjects, reporting adverse events to the FDA and the IRB, and record-keeping.  You will also make sure that you conduct all Trial Administrator Clinical Studies in accordance with the relevant Study Approvals, and that any changes or deviations are promptly reported to the FDA, the IRB, and other regulatory authorities in accordance with the Applicable Laws.</p>
          
              <p>4.7 You may not access or attempt to use or access any portion or feature of the Trial Tool, or any other systems or networks connected to the Trial Tool or any Samsung server, or to any of the services offered on or through the Trial Tool, through any automated tools (including software and/or hardware), functions, services or otherwise (including scripts or web crawlers) or by hacking or any other unauthorized or illegitimate means.</p>
          
              <p>4.8 You will not use or attempt to use the Trial Tool or parts of the Trial Tool other than through the interface Samsung provides to you.</p>
          
              <p>4.9 You will comply with and follow all instructions that Samsung may provide in connection with the Trial Tool.</p>
          
              <p>4.10 You will not engage in any activity that may interfere with or disrupt the Trial Tool or any servers, networks or other equipment connected to the Trial Tool.</p>
          
              <p>4.11 You understand that if you use any Trial Tool features over a mobile networks, your network provider may charge you for access to its network, the duration of your mobile phone's / mobile device's or other device's connection to the network and the data volume used to use the Trial Tool or Third Party Products.  You are entirely responsible for such costs.</p>
            </li>
            <li>
              <p><strong><em>Samsung's Rights Regarding the Trial Tool.</em></strong></p>
          
              <p>5.1 While we strive to keep you updated and informed of any changes to the Trial Tool, we may at any time, with or without notice:</p>
          
              <ul>
                <li>change, suspend or stop providing the Trial Tool or any part of the Trial Tool;</li>
                <li>disable or suspend your use of the Trial Tool including access to your Trial Tool account(s) and any files or other content contained in your account(s) either temporarily or permanently;</li>
                <li>set a limit on the number of transmissions you may send or receive through the Trial Tool or on the amount of storage space allocated to the Trial Tool or any part of the Trial Tool; </li>
                <li>prescreen, review, flag, filter, modify, refuse, reject, block access to or remove any or all Content from the Trial Tool; or</li>
                <li>remove your access to any software, tools, or other content from third parties (collectively, "Third Party Products") accessible through the Trial Tool that Samsung discovers violates the legal agreements that the developer or seller of the Third Party Product enters into with Samsung, or violates any applicable other agreements, laws or regulations.  Samsung may remove any such Third Party Product from your device remotely.</li>
              </ul>
            </li>
            <li>
              <p><strong><em>How Samsung May Change These Trial Tool Terms.</em></strong></p>
          
              <p>6.1 Samsung may modify, update, add to, discontinue, remove or otherwise change any portion of these Trial Tool Terms at any time and may require you to accept new or updated Trial Tool Terms as a condition of your continued use of the Trial Tool, or may otherwise notify you of such changes through the Trial Tool or Trial Tool home page.</p>
          
              <p>6.2 When Samsung amends these Trial Tool Terms, we will revise the "Last Updated" date located at the top of these Trial Tool Terms.  For changes that we consider to be material, we will place a notice on the Trial Tool home page for a reasonable amount of time. The notice will say something like "Updated Trial Tool Terms". If you provide information to us or access or use any Trial Tool in any way after these Trial Tool Terms have been changed, you will be deemed to have unconditionally consented and agreed to such changes.  The most current version of these Trial Tool Terms will be available on the Trial Tool home page and will supersede all previous versions.</p>
            </li>
            <li>
              <p><strong><em>Software and Software Updates and Updates to the Trial Tool.</em></strong>  Software and other Trial Tool services originating from Samsung or the Platform may communicate with Samsung servers from time to time to check for available updates, such as bug fixes, patches, enhanced functions, missing plug-ins and new versions (collectively, "Software Updates").  By using or installing the Trial Tool software or other services and/or Third Party Products, you agree to these automatically requested and installed Software Updates.  These Software Updates may be in various forms and are generally provided for the purposes of improving the performance, security and reliability of the Trial Tool or the applicable Third Party Product or the device you use to access the Trial Tool.</p>
            </li>
            <li>
              <p><strong><em>Content Provided in or through the Trial Tool and Content Rights.</em></strong>
           8.1 All content available in or through the Trial Tool or accessible as part of or by the use of the Trial Tool (including audio files, data files, images, photographs, software, videos and written text) ("Content") is entirely the responsibility of the originator of such Content.  The Content may include, without limitation, advertisements, promotional material, sponsored elements or other material. </p>
          
              <p>8.2 The Content may be protected by proprietary or intellectual property rights of third parties (such as partners, advertisers and sponsors or their agents who provide Content to Samsung).  You are not permitted to modify, rent, lease, loan, sell, distribute or create derivative works based on any Content (either in whole or in part) or to grant licenses to the Content.</p>
          
              <p>8.3 Any use of the Services is entirely at your own risk.</p>
            </li>
            <li>
              <p><strong><em>Trial Tool Content and Trial Tool Content License.</em></strong></p>
          
              <p>9.1 You represent that you have sufficient rights to the Trial Tool Content to grant us the Trial Tool Content License below, and that your Trial Tool Content does not violate or infringe anyone's intellectual property or other rights.</p>
          
              <p>9.2 You hereby grant Samsung a worldwide, royalty-free, fully paid up, non-exclusive license to copy, reproduce, adapt, modify, edit, distribute, translate, digitize, publish, and otherwise use or display the Trial Tool Content (the "Trial Tool Content License") to the full extent necessary to provide the Trial Tool and any related products or services. </p>
          
              <p>9.3 In addition, we may use your Trial Participant Information, including but not limited to, in an aggregate, non-identifying manner to create or to have a third party create statistical data for internal or business purposes. However, we agree that we will not disclose any such data or information in a manner that would reveal your identity, or otherwise allow a third party to be able to identify you, or your Trial Participant Information.  </p>
          
              <p>9.4 The Trial Tool Content License includes a right for Samsung to (a) perform all technical steps necessary to process and prepare the Trial Tool Content for use in the Trial Tool, including any modification and/or adaption required to provide the Trial Tool to Trial Tool Administrators and/or to transmit or distribute the Trial Tool Content over public networks and in media and (b) make available and sublicense the Trial Tool Content to third parties for the use of the Trial Tool Content in connection with the provision of the Trial Tool by these third parties.</p>
          
              <p>9.5 You are responsible for protecting and enforcing any intellectual property rights that you have in your Trial Tool Content and Samsung is not obliged to protect or enforce any intellectual property rights that you have in your Trial Tool Content on your behalf.</p>
          
              <p>9.6 You are entirely responsible for backing up any of your Trial Tool Content stored with Samsung or through the Trial Tool to another location outside the Trial Tool or the Platform (e.g., by means of creating local copies or backups with specialized online backup services) to avoid loss of your Trial Tool Content and other data.</p>
          
              <p>9.7 If you send or post certain specific submissions at our request or if you send us any unsolicited creative suggestions, ideas, notes, photographs, drawings, concepts, or any other information (collectively, the "Submissions"), your Submission will be treated as non-confidential and non-proprietary.  "Submissions" are separate and apart from Trial Tool Content.  You grant us the right to use any Submission without restriction and for any purpose without compensation or attribution to you, and you hereby irrevocably waive, release and give up any claim that any use of such Submission violates any of your rights related to such Submissions.  Samsung will not be liable for any use or disclosure of any Submissions. You represent that such Submission is original with you and does not violate or infringe upon the rights of any third parties, including, without limitation, any intellectual property rights or rights of publicity and/or privacy. </p>
            </li>
            <li>
              <p><strong><em>Samsung Services License.</em></strong></p>
          
              <p>10.1 As between you and Samsung, Samsung owns all right, title and interest in and to the Trial Tool and any related products and services, including without limitation all applicable intellectual property rights or other proprietary rights in such Trial Tool and related products and services, regardless of whether registered/legally secured or not.</p>
          
              <p>10.2 Except for the rights granted to you in these Trial Tool Terms, Samsung retains all rights in and to the Trial Tool and related products and services.</p>
          
              <p>10.3 You are not permitted to (a) grant any third party a license to use the Trial Tool and related products and services or otherwise to access your account or the Trial Tool and related products and services, (b) use the Trial Tool or related products or services to provide services to any third parties or (c) otherwise assign, grant a sublicense in, or grant a security interest in or over any rights granted to you under the Trial Tool Terms, loan or lease the Trial Tool or otherwise transfer any such rights to any third party.</p>
          
              <p>10.4 You may not copy, edit, modify, alter or create a derivative work of, reverse engineer, decompile or otherwise attempt to extract the source code of the Services (or any part of the Services), unless expressly permitted by Samsung in writing, or to the extent permitted under the laws applicable to you, and you will not permit or grant a license to any third party to do so.</p>
            </li>
            <li>
              <p><strong><em>Trademarks.</em></strong></p>
          
              <p>11.1 You may not use any of Samsung's trade names, trademarks, service marks, logos, domain names, or other distinctive brand features without obtaining advance written consent from Samsung.  </p>
          
              <p>11.2 You may not remove, obscure, conceal, modify or otherwise change any proprietary rights notices, signs, trademarks, service marks, trade names, logos or other marks of Samsung or any third party (including copyright and trademark notices) (the "Marks") that pertain to, are affixed to or which are contained within the Services and you agree not to use any such Marks in a way that is intended to or can foreseeably confuse or mislead others about the owner, license holder or authorized user of such Marks.</p>
            </li>
            <li>
              <p><strong><em>Your Warranties and Representations.</em></strong></p>
              <p>12.1 You are entirely responsible for the content you provide and for any consequences arising in connection with that content (including any loss or damage suffered or incurred by Samsung).  In particular, you warrant and represent to Samsung that:</p>
              <ul>
                <li>You own or have all rights pertaining to the content or are otherwise authorized to grant Samsung the Trial Tool Content License;</li>
                <li>The content does not and will not infringe any intellectual property or other third party rights;</li>
                <li>The content does not and will not contain any material which is harmful, inaccurate, pornographic, abusive, obscene, threatening, defamatory, or which is otherwise illegal or which does not comply with applicable law or any content guidelines provided by Samsung; </li>
                <li>The content will not contain any viruses or other harmful software, code or similar means and devices which could damage, harm, disable or otherwise impact or limit the function and performance of the services and/or any device accessing such content.  Regardless of whether this device belongs to Samsung or any other user or third party including server, networks nodes or any similar equipment;</li>
                <li>The content will comply and conform to any age classification rules and requirements (including accurate and adequate classification and rating of any content, as the case may be) under the laws of any country, including the country in which you are a resident or from which you are using the Trial Tool; and</li>
                <li>The use of the content by Samsung or Third Party Products will not impose any obligation upon Samsung to pay any kind of monetary contribution (including license fees, dues or otherwise) to any third party.</li>
              </ul>
            <p>12.2 You agree to indemnify and hold harmless Samsung from any loss, damage, liability or expense incurred by Samsung as a result of any breach of your representations, warranties, covenants or obligations under these terms and conditions.</p>
            </li>
            <li>
              <p><strong><em>Samsung's Warranties and Representations.</em></strong></p>
          
              <p>13.1 EXCEPT AS OTHERWISE SET FORTH THESE TRIAL TOOL TERMS, THE TRIAL TOOL, INCLUDING WITHOUT LIMITATION, ANY UPDATES, FROM SAMSUNG ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS, AND SAMSUNG MAKES NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY WITH RESPECT TO THE SERVICES AND SAMSUNG EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES AND CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE OR NON-INFRINGEMENT.  YOUR USE OF THE TRIAL TOOL IS AT YOUR OWN DISCRETION AND RISK, AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE THAT RESULTS FROM THE USE OF THE SERVICES INCLUDING, BUT NOT LIMITED TO, ANY DAMAGE TO YOUR COMPUTER SYSTEM, HARDWARE, SOFTWARE OR LOSS OF DATA. </p>
            </li>
            <li>
              <p><strong><em>Your Liability.</em></strong></p>
          
              <p>14.1 You are entirely responsible for any breach of your obligations under:</p>
          
              <ul>
                <li>These Trial Tool Terms; and</li>
                <li>Any applicable law or regulation in the relevant jurisdictions, including the jurisdiction where you are a resident or from where you are using the Trial Tool or conducting a Clinical Trial and for the consequences of any such breach, including any loss or damage which Samsung or any third party may incur or suffer.  Samsung will have no responsibility to you or to any third party in respect of such breach.</li>
              </ul>
            </li>
            <li>
              <p><strong><em>Samsung's Liability.</em></strong>  SUBJECT TO THE TERMS AND CONDITIONS OF THESE TRIAL TOOL TERMS AND TO THE FULLEST EXTENT ALLOWED AND PERMITTED BY APPLICABLE LAWS AND REGULATIONS, SAMSUNG SHALL NOT, UNDER ANY CIRCUMSTANCES, BE LIABLE TO YOU OR ANY THIRD PARTY THROUGH YOU FOR PERSONAL INJURY OR ANY CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, INDIRECT, PUNITIVE OR SPECIAL DAMAGES WHATSOEVER, INCLUDING, WITHOUT LIMITATION, DAMAGES FOR DELAY OF DELIVERY, LOSS OF PROFITS, LOSS OF DATA, LOSS OF GOODWILL, BUSINESS INTERRUPTION OR ANY OTHER COMMERCIAL DAMAGES OR LOSSES, ARISING OUT OF OR IN RELATION TO THIS AGREEMENT, YOUR USE OF THE SERVICES, ANY THIRD PARTY PRODUCTS OR OTHER PRODUCTS OR SERVICES PROVIDED BY OR THROUGH SAMSUNG UNDER THIS AGREEMENT, WHETHER BASED ON BREACH OF CONTRACT, BREACH OF WARRANTY, TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY OR OTHERWISE, EVEN IF SAMSUNG HAS BEEN ADVISED OF OR IS AWARE OF THE POSSIBILITY OF SUCH DAMAGES AND NOTWITHSTANDING THE FAILURE OF ESSENTIAL PURPOSE OF ANY REMEDY. YOUR UNDERSTANDING, ACKNOWLEDGEMENT AND ACCEPTANCE OF THESE TRIAL TOOL TERMS ARE THE LEGAL BASIS AND CONSIDERATION FOR THE LICENSES GRANTED UNDER IT.  In no event shall Samsung's total liability to you under these Trial Tool Terms for all damages (other than as may be required by applicable law in cases involving personal injury) exceed the amount of fifty dollars ($50.00).</p>
            </li>
            <li>
              <p><strong><em>Language of this Agreement.</em></strong>  Samsung may provide you with a translation of the English version of these Trial Tool Terms.  This translation is provided for your convenience only.  If there is any conflict between the English language version and the translation version of these Trial Tool Terms and to the extent permissible by applicable law, the English language version takes precedence.</p>
            </li>
            <li>
              <p><strong><em>Procedure for Making Claims and Notices Regarding Infringement of Intellectual Property Rights and Other Rights.</em></strong></p>
          
              <p>17.1 Samsung may respond to notices of alleged copyright infringement or violation of other laws in accordance with applicable law and may terminate, suspend or block access (either temporary or permanently) to accounts of Users who repeatedly infringe copyright laws or violate other applicable law.
          17.2 Any notices regarding any copyright infringement or violation of other laws by the Services, any content provided with or displayed in the Services or any User Content should be sent to VOTB@ssi.samsung.com.</p>
            </li>
            <li>
              <p><strong><em>General Provisions.</em></strong></p>
          
              <p>18.1 Samsung will rely only on the written Trial Tool Terms.  Any representations, statements or agreements made or entered into elsewhere, whether directly or indirectly, written or oral or in advertising are not binding towards Samsung unless expressly confirmed in writing by Samsung to you.</p>
          
              <p>18.2 Samsung may provide you with notices (including notices relating to changes to the Agreement or termination of the Services or parts thereof) by email, ordinary mail, or postings on or via the Trial Tool.</p>
          
              <p>18.3 Failure by Samsung to exercise or enforce any legal right or remedy under these Trial Tool Terms or which Samsung has the benefit of under any applicable law will not be construed as a formal waiver of Samsung's rights or remedies.</p>
          
              <p>18.4 If any provision of these Trial Tool Terms is held to be invalid, illegal or unenforceable (in whole or in part) as determined by a court of law having jurisdiction to decide on this matter, the validity, legality and enforceability of the remaining provisions shall not in any way be affected or impaired.</p>
          
              <p>18.5 You may not transfer, assign or otherwise dispose of these Trial Tool Terms or any of your rights or obligations arising under these Trial Tool Terms without the prior written consent of Samsung.</p>
          
              <p>18.6 This Agreement shall be governed by and construed in accordance with the laws of the State of California, USA, without regard to any conflict-of-laws rules. All disputes, controversies or claims between the parties arising out of or in connection with these Trial Tool Terms (including its existence, validity or termination) shall be finally resolved by arbitration to be held in Santa Clara, California and conducted in English under the Rules of Arbitration of the International Chamber of Commerce; The arbitral award shall be final and binding on the parties. Except to the extent entry of judgment and any subsequent enforcement may require disclosure, all matters relating to the arbitration, including the award, shall be held in confidence. Regardless of the arbitration requirement above, each party may enforce its or its affiliates' intellectual property rights in any court of competent jurisdiction, including but not limited to equitable relief. </p>
            </li>
          </ol>
        </div>
      </Modal>
    </div>
