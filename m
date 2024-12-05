Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E5A9E5D1F
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  5 Dec 2024 18:30:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tJFgE-0001Ul-Dn
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 05 Dec 2024 17:30:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1tJFgD-0001Ue-HV
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 05 Dec 2024 17:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+qJf5Q6Eld3EBOT/qf+hwJg4g1YOizrbg7xTLfswxlE=; b=BCpg9WAAxlq3Pg+SMZeCIkl4mU
 5LwM2ETX54yf+drhJZIfhYDIXR0PSRu1pc4gEq71STyM0LOdjDOxIjyd5kyHYPa8JdkprhVfgYiuI
 3kIa+YhP8y/ESxoTrY3nWhydkIBnhxlzRv1cqdYmau+iRjU+HpJqCZjktne8nbDWHcX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+qJf5Q6Eld3EBOT/qf+hwJg4g1YOizrbg7xTLfswxlE=; b=NkpZJG1aV2ppJeY2Sws8HUnZP+
 q6399VitFLTB05EJL45Lg5zvNqAX+zhcLJCjBvTZ2IIVWrSXeyKpxEhMMiZq5OyrkS9/vOZ0+TCVf
 gSXHiQwSKFUb/fRL2UR5TCsOCb9qPE3fSz9ZWwQXCCVEwYHGi2ifGz41pPx+qcbbtv08=;
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tJFgB-0006zS-Lw for kgdb-bugreport@lists.sourceforge.net;
 Thu, 05 Dec 2024 17:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=+qJf5Q6Eld3EBOT/qf+hwJg4g1YOizrbg7xTLfswxlE=; b=P3wLQoIjFeVD+btfbNE+DbucDt
 sJimhkl12CQr6KNZYt3maAUojCYSSU95lNWp17vOvQ8bGgMqwBYQi6bbcUEWXT/ZWoDAzM/KjACB6
 sW/INyYFUMEgD1PzIIsU8fOLuEgIFoWbz/rP0HIw9txoubV3IqDZyhHnecsr0DiK2YB0zCwOJXb5a
 vL+0wKfT/Io723kp6wbB2fuCEk4p3qwdtXGeLonLVPMyZriWehkirWqc1UdR15QrZ7QLnqcwkMPV9
 5aNkr78eVqHvSZlqJEfe7vgSG4hK1UWAKMlUoS31qexZl7zlJuKFb2iPu3Bdm3HSVK3iQLWuS978B
 cvV3riTQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tJFLd-00000002x1e-0eJC; Thu, 05 Dec 2024 17:09:05 +0000
Message-ID: <cf29b196-5376-4fdf-88b5-28b1d0da9c8c@infradead.org>
Date: Thu, 5 Dec 2024 09:08:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
 <e3e78060-0939-4078-989c-acd7ca1c90d2@infradead.org>
 <20241205090914.h34rhyzhhazas6l4@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241205090914.h34rhyzhhazas6l4@basti-XPS-13-9310>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/5/24 1:09 AM, Sebastian Fricke wrote: > Greetings! >
    > On 04.12.2024 15:09, Randy Dunlap wrote: >> >> >> On 12/4/24 3:07 PM, Doug
    Anderson wrote: >>> Hi, >>> >>> On Wed, Dec 4, 2024 at 2:17 PM [...] 
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [90.155.92.199 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [90.155.92.199 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [90.155.92.199 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
X-Headers-End: 1tJFgB-0006zS-Lw
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: move dev-tools
 debugging files to process/debugging/
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, Daniel Thompson <danielt@kernel.org>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

CgpPbiAxMi81LzI0IDE6MDkgQU0sIFNlYmFzdGlhbiBGcmlja2Ugd3JvdGU6Cj4gR3JlZXRpbmdz
IQo+IAo+IE9uIDA0LjEyLjIwMjQgMTU6MDksIFJhbmR5IER1bmxhcCB3cm90ZToKPj4KPj4KPj4g
T24gMTIvNC8yNCAzOjA3IFBNLCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4g
T24gV2VkLCBEZWMgNCwgMjAyNCBhdCAyOjE34oCvUE0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gTW92ZSBnZGIgYW5kIGtnZGIgZGVidWdnaW5n
IGRvY3VtZW50YXRpb24gdG8gdGhlIGRlZGljYXRlZAo+Pj4+IGRlYnVnZ2luZyBkaXJlY3Rvcnkg
KERvY3VtZW50YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvKS4KPj4+PiBBZGp1c3QgdGhlIGluZGV4
LnJzdCBmaWxlcyB0byBmb2xsb3cgdGhlIGZpbGUgbW92ZW1lbnQuCj4+Pj4gVXBkYXRlIGxvY2F0
aW9uIG9mIGtnZGIucnN0IGluIE1BSU5UQUlORVJTIGZpbGUuCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPj4+PiBDYzogU2ViYXN0
aWFuIEZyaWNrZSA8c2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJvcmEuY29tPgo+Pj4+IENjOiBKb25h
dGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+Pj4+IENjOiB3b3JrZmxvd3NAdmdlci5rZXJu
ZWwub3JnCj4+Pj4gQ2M6IEphc29uIFdlc3NlbCA8amFzb24ud2Vzc2VsQHdpbmRyaXZlci5jb20+
Cj4+Pj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsdEBrZXJuZWwub3JnPgo+Pj4+IENjOiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4+Pj4gQ2M6IGxpbnV4LWRl
YnVnZ2Vyc0B2Z2VyLmtlcm5lbC5vcmcKPj4+PiBDYzoga2dkYi1idWdyZXBvcnRAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cj4+Pj4gLS0tCj4+Pj4gwqBEb2N1bWVudGF0aW9uL2Rldi10b29scy9pbmRl
eC5yc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4+IMKgRG9jdW1lbnRhdGlvbi97ZGV2
LXRvb2xzID0+IHByb2Nlc3MvZGVidWdnaW5nfS9nZGIta2VybmVsLWRlYnVnZ2luZy5yc3QgfCAw
Cj4+Pgo+Pj4gQWZ0ZXIgYXBwbHlpbmcgeW91ciBwYXRjaCBhbmQgZG9pbmcgYGdpdCBncmVwCj4+
PiBnZGIta2VybmVsLWRlYnVnZ2luZy5yc3RgLCBJIHN0aWxsIHNlZSBzZXZlcmFsIHJlZmVyZW5j
ZXMgdG8gdGhlIG9sZAo+Pj4gbG9jYXRpb24uIFRob3NlIHNob3VsZCBiZSB1cGRhdGVkIGFzIHBh
cnQgb2YgdGhpcyBwYXRjaCwgcmlnaHQ/Cj4+Pgo+Pj4KPj4+Cj4+Pj4gwqBEb2N1bWVudGF0aW9u
L3Byb2Nlc3MvZGVidWdnaW5nL2luZGV4LnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKysKPj4+PiDCoERvY3VtZW50YXRp
b24ve2Rldi10b29scyA9PiBwcm9jZXNzL2RlYnVnZ2luZ30va2dkYi5yc3TCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDAKPj4+Cj4+PiBTaW1pbGFybHkgYGdpdCBncmVwIGtnZGIu
cnN0YCBzdGlsbCBoYXMgc2V2ZXJhbCByZWZlcmVuY2VzIHRvIHRoZSBvbGQgbG9jYXRpb24uCj4+
Cj4+Cj4+IFRoYW5rcy4gSSBzaG91bGQgaGF2ZSBkb25lIHRoYXQuwqAgOigKPj4KPj4+PiDCoE1B
SU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMiArLQo+Pj4+IMKgNSBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0
Cj4+Pj4gaW5kZXggM2MwYWMwOGIyNzA5Li5jMWU3M2U3NWY1NTEgMTAwNjQ0Cj4+Pj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0Cj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMvaW5kZXgucnN0Cj4+Pj4gQEAgLTI3LDggKzI3LDYgQEAgRG9jdW1lbnRhdGlv
bi9kZXYtdG9vbHMvdGVzdGluZy1vdmVydmlldy5yc3QKPj4+PiDCoMKgwqAga21lbWxlYWsKPj4+
PiDCoMKgwqAga2NzYW4KPj4+PiDCoMKgwqAga2ZlbmNlCj4+Pj4gLcKgwqAgZ2RiLWtlcm5lbC1k
ZWJ1Z2dpbmcKPj4+PiAtwqDCoCBrZ2RiCj4+Pj4gwqDCoMKgIGtzZWxmdGVzdAo+Pj4+IMKgwqDC
oCBrdW5pdC9pbmRleAo+Pj4+IMKgwqDCoCBrdGFwCj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2LXRvb2xzL2dkYi1rZXJuZWwtZGVidWdnaW5nLnJzdCBiL0RvY3VtZW50YXRpb24v
cHJvY2Vzcy9kZWJ1Z2dpbmcvZ2RiLWtlcm5lbC1kZWJ1Z2dpbmcucnN0Cj4+Pj4gc2ltaWxhcml0
eSBpbmRleCAxMDAlCj4+Pj4gcmVuYW1lIGZyb20gRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvZ2Ri
LWtlcm5lbC1kZWJ1Z2dpbmcucnN0Cj4+Pj4gcmVuYW1lIHRvIERvY3VtZW50YXRpb24vcHJvY2Vz
cy9kZWJ1Z2dpbmcvZ2RiLWtlcm5lbC1kZWJ1Z2dpbmcucnN0Cj4+Pj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9w
cm9jZXNzL2RlYnVnZ2luZy9pbmRleC5yc3QKPj4+PiBpbmRleCBmNmU0YTAwZGZlZTMuLmJjNGE4
MTZlM2QzMiAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvZGVidWdnaW5n
L2luZGV4LnJzdAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvaW5k
ZXgucnN0Cj4+Pj4gQEAgLTEyLDYgKzEyLDggQEAgZ2VuZXJhbCBndWlkZXMKPj4+Pgo+Pj4+IMKg
wqDCoCBkcml2ZXJfZGV2ZWxvcG1lbnRfZGVidWdnaW5nX2d1aWRlCj4+Pj4gwqDCoMKgIHVzZXJz
cGFjZV9kZWJ1Z2dpbmdfZ3VpZGUKPj4+PiArwqDCoCBnZGIta2VybmVsLWRlYnVnZ2luZwo+Pj4+
ICvCoMKgIGtnZGIKPj4+Cj4+PiBTaG91bGQgdGhlIGxpc3QgYWJvdmUgYmUga2VwdCBhbHBoYWJl
dGljYWwuIFRoZSBsaXN0IHlvdSByZW1vdmVkIHRoZXNlCj4+PiBlbnRyaWVzIGZyb20gd2FzIF9h
bG1vc3RfIGFscGhhYmV0aWNhbC4uLgo+Pgo+PiBOb3QgdGhhdCBJIGtub3cgb2YuwqAgSSdsbCBs
aXN0ZW4gZm9yIG90aGVyIG9waW5pb25zIHRob3VnaC4KPiAKPiBJJ2Qgc2F5IGl0IGlzIGVhc3kg
ZW5vdWdoIGZvciB1cyB0byBkbywgc28gSSdkIGFkdm9jYXRlIGZvciBtYWtpbmcgdGhlCj4gbGlz
dCBhbHBoYWJldGljYWwgKC4uIGV2ZW4gdGhvdWdoIEkgZm9yZ290IHRvIGRvIHRoYXQgaW4gbXkg
aW5pdGlhbCBsaXN0IPCfmIUpCgpPSywgd2lsbCBkby4KVGhhbmtzLgoKLS0gCn5SYW5keQoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3Jl
cG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0
Cg==
