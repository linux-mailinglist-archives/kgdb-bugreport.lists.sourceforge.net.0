Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBC815A28
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 16 Dec 2023 17:21:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rEXPc-000065-TN
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 16 Dec 2023 16:21:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael@amarulasolutions.com>) id 1rEXPc-00005v-17
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 16 Dec 2023 16:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7CS7KA2gLSeCNiZW3GKISJfWPIn3uo8dgVC5eGHNM90=; b=LyaZoatEnGgVdEbCtMCyomZL+M
 Shw8iMswlRQp3Oge3b8aAQbV6hsLYTFup3nMcj+7kEWhNFly4zi+dKldlClH93YcgHHhGVR8r3vLO
 Ry5rHmPH7QzS+Mo53ayOU9KJ4PTurgwTeNNedYpG3xOW21ca4JmgSr5whaB2gBcXF/+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7CS7KA2gLSeCNiZW3GKISJfWPIn3uo8dgVC5eGHNM90=; b=SjSA0XvtIz+iqoHXRPG58/KbwQ
 bThwF1VsLqv/Hg1nnKLtg0Bic364cgbI70fMPf2BIGbVW8JX6djc4LadLp3EuKg17vlOi19YJtHRA
 SgHs3MS0LDvpusqsCwJhzH8jy/8Kwn7ZMBoF3qC6/miqY1PnV4H4QjVEvdzdaOkgZG5g=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEXPY-0002ij-14 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 16 Dec 2023 16:21:11 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a1f5cb80a91so203810466b.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 16 Dec 2023 08:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702743656; x=1703348456;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CS7KA2gLSeCNiZW3GKISJfWPIn3uo8dgVC5eGHNM90=;
 b=OwKlUah96mQ/aJDX0adOuC3MSwQH2o+iCQ5ZB+GX3UJE887bUjIVFTtoQAunXj5qre
 pcFRBmC2DT984d6Q1aO1cHUHLC0ndqFB8p/OotH84/yvCR0+w1et4tLJPXwS8dhv+tRX
 EwEeHqmX51AqhMTeRpZ7pN4OP8m3P1xt7k9HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743656; x=1703348456;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7CS7KA2gLSeCNiZW3GKISJfWPIn3uo8dgVC5eGHNM90=;
 b=I7bY2tQCE0fR+mvQL6Ghxji4ElgC6cOO2Zk8ULnr6Vqjhr87PMterfmoKYEV69Ocmq
 2Jff2vLsVz/3TyaKJXUVexfVexiw7OEClGxYNztpV0jAep4rc2G6NViNW+xB53LJvqZx
 iKRcQei0+WOvVUKasBfxoFmdqqGr9C4hSvnxt89oK/BirPetbiijYiOeRuOjtTSlXifO
 FJhhCYPMGRkoDpPgiHHf5IYQZbau0evoMP/zcNcc8bHjbFAUGE3A9cVp2my4a/e/wZl3
 t+mlPczUmh960MQBxlPDIChk/bG420JdrJqQU11i48JsbBdICbK1615lIDgrJwKhq6Ql
 AmZw==
X-Gm-Message-State: AOJu0YymVUE0DtsFLpFN2RdgsKi/FKu0BNtqAXJ8ohJJVtXcQKJdisQr
 dSvIREtwHlPws8mCgFiPJML65EZvtFqH2DbfFK0UBg==
X-Google-Smtp-Source: AGHT+IEIO8Wqo3CheMl1kMfShPLFv9nb1Hcs8aH/BQwHSkOslvvi8KFpgHUPCCNDrrx5DZ7bwH/g7efkia/9pJsM3zY=
X-Received: by 2002:a17:906:590:b0:a23:3829:9e2 with SMTP id
 16-20020a170906059000b00a23382909e2mr56209ejn.141.1702743655722; Sat, 16 Dec
 2023 08:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20231208212845.1679621-1-michael@amarulasolutions.com>
 <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
 <CAOf5uwmT3uFQhyTOkNDMana5na5jcKm81tdyeann2UnFwaQp5w@mail.gmail.com>
 <CAD=FV=WrBg9PuDW__pZbo5YNuWct17gcK4FF-xKeyxEOsw6Qag@mail.gmail.com>
 <CAOf5uw=6=zNmtVU7cOWv6xTaCghvX9j8pA9ijJxEqYpzikGdcg@mail.gmail.com>
 <CAOf5uwmTg_T+vHsZwMtkPbxqQdQx4VucMni+f71KtGZY_XdgcA@mail.gmail.com>
In-Reply-To: <CAOf5uwmTg_T+vHsZwMtkPbxqQdQx4VucMni+f71KtGZY_XdgcA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 16 Dec 2023 17:20:44 +0100
Message-ID: <CAOf5uwmvHWCLhh3iAf69D+r_KRZKY6fP0NK5Xtz6tHoAAgYayw@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi On Sat, Dec 16, 2023 at 2:45 PM Michael Nazzareno Trimarchi
    <michael@amarulasolutions.com> wrote: > > Hi Doug > > On Tue, Dec 12, 2023
    at 9:54 AM Michael Nazzareno Trimarchi > <michael@amarulasolu [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.42 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEXPY-0002ij-14
Subject: Re: [Kgdb-bugreport] [RFC PATCH] tty: serial: kgdboc: Fix 8250_*
 kgd over serial
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkKCk9uIFNhdCwgRGVjIDE2LCAyMDIzIGF0IDI6NDXigK9QTSBNaWNoYWVsIE5henphcmVubyBU
cmltYXJjaGkKPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gSGkgRG91
Zwo+Cj4gT24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgOTo1NOKAr0FNIE1pY2hhZWwgTmF6emFyZW5v
IFRyaW1hcmNoaQo+IDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBEb3VnCj4gPgo+ID4gT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTE6MDDigK9QTSBEb3Vn
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSwK
PiA+ID4KPiA+ID4gT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTo0MuKAr1BNIE1pY2hhZWwgTmF6
emFyZW5vIFRyaW1hcmNoaQo+ID4gPiA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiA+IDEuIGluaXRfa2dkYm9jKCkgcnVucyBhbmQgcmVnaXN0ZXJz
IHRoZSBzaW5nbGV0b24ga2dkYiAicGxhdGZvcm0gZHJpdmVyIi4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiAyLiBUaGUgcGxhdGZvcm0gZHJpdmVyJ3MgcHJvYmUgZnVuY3Rpb24sIGtnZGJvY19wcm9iZSgp
LCBydW5zIGFuZAo+ID4gPiA+ID4gY2hlY2tzIHRvIHNlZSBpZiB0aGUgY29uc29sZSBpcyByZWFk
eSBieSBsb29raW5nIGF0IHRoZSByZXR1cm4gdmFsdWUKPiA+ID4gPiA+IG9mIGNvbmZpZ3VyZV9r
Z2Rib2MoKS4gSWYgaXQncyByZWFkeSB0aGVuIHdlJ3JlIGdvb2QgdG8gZ28uIElmIGl0J3MKPiA+
ID4gPiA+IG5vdCByZWFkeSB0aGVuIHdlIGRlZmVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvIEkg
dGhpbmsgdGhlIGJ1ZyBoZXJlIGlzIHRoYXQgc29tZWhvdyB0aGUgY29uc29sZSBsb29rcyAicmVh
ZHkiCj4gPiA+ID4gPiAoYmVjYXVzZSB0dHlfZmluZF9wb2xsaW5nX2RyaXZlcigpIGNhbiBmaW5k
IGl0KSBidXQgaXQgaXNuJ3QgYWN0dWFsbHkKPiA+ID4gPiA+IHJlYWR5IHlldCAoYmVjYXVzZSBp
dCBjcmFzaGVzKS4gVGhhdCdzIHdoYXQgeW91IG5lZWQgdG8gZml4Lgo+ID4gPiA+ID4KPiA+ID4g
Pgo+ID4gPiA+IFRoZSBwb2xsaW5nIGRyaXZlciBsb29rIGZvciB1YXJ0IGFuZCB1YXJ0ODI1MF9j
b3JlIGlzIHJlZ2lzdGVyZWQgYW5kIDQgZmFrZSB1YXJ0Cj4gPiA+ID4gYXJlIHRoZXJlIGJ1dCB0
aGVyZSBhcmUgbm90IHN0aWxsIHJlcGxhY2VkIGJ5IHBsYXRmb3JtIGRyaXZlciB0aGF0IGNhbgo+
ID4gPiA+IGNvbWUgbGF0ZXIuCj4gPiA+ID4gVGhlIHRyeV9wb2xsaW5nIGZpbmQgaXQgYnV0IGl0
J3MgdGhlIGlzYS04MjUwIGRyaXZlci4gSXQgbWVhbnMgdGhhdAo+ID4gPiA+IGFkZF91YXJ0IDgy
NTAgaXMKPiA+ID4gPiBub3Qgc3RpbGwgaGFwcGVuCj4gPiA+Cj4gPiA+IFRoZSA4MjUwIGRyaXZl
ciBpcyBhbHdheXMgYSBtYXplLCBzbyB5b3UgbWlnaHQgbmVlZCB0byBkbyBhIGJ1bmNoIG9mCj4g
PiA+IGRpZ2dpbmcuIC4uLmJ1dCBpdCBzdXJlIHNvdW5kcyBsaWtlIHRoZSBjb25zb2xlIHNob3Vs
ZG4ndCBiZQo+ID4gPiByZWdpc3RlcmVkIHVudGlsIHRoZSBjb3JyZWN0IG9wcyBhcmUgaW4gcGxh
Y2UuIFRoYXQgZWl0aGVyIG1lYW5zCj4gPiA+IGdldHRpbmcgdGhlIG9wcyBwdXQgaW4gcGxhY2Ug
ZWFybGllciBvciBkZWZlcnJpbmcgd2hlbiB0aGUgY29uc29sZSBpcwo+ID4gPiByZWdpc3RlcmVk
Li4uCj4gPiA+Cj4gPgo+ID4gWW91ciBwb2ludCBpcyBwcmV0dHkgY2xlYXIgYW5kIG15IGluaXRp
YWwgaWRlYSB3YXMgdG8gZmluZCBhIHJlYWwgZml4Lgo+ID4gVGhpcyBjb21lIHRvIGF2b2lkCj4g
PiBicmVha2luZyBleGlzdGluZyBzZXR1cCBidXQgYW55d2F5IEkgd2lsbCBkaWcgaW4gaXQgbW9y
ZQo+ID4KPiA+IE1pY2hhZWwKPgo+IFdoYXQgYWJvdXQgdGhpcz8KPgo+IC0tLSBhL2RyaXZlcnMv
dHR5L3R0eV9pby5jCj4gKysrIGIvZHJpdmVycy90dHkvdHR5X2lvLmMKPiBAQCAtMzg1LDYgKzM4
NSw3IEBAIHN0cnVjdCB0dHlfZHJpdmVyICp0dHlfZmluZF9wb2xsaW5nX2RyaXZlcihjaGFyCj4g
Km5hbWUsIGludCAqbGluZSkKPiAgICAgICAgIGludCB0dHlfbGluZSA9IDA7Cj4gICAgICAgICBp
bnQgbGVuOwo+ICAgICAgICAgY2hhciAqc3RyLCAqc3RwOwo+ICsgICAgICAgaW50IGluZGV4Owo+
Cj4gICAgICAgICBmb3IgKHN0ciA9IG5hbWU7ICpzdHI7IHN0cisrKQo+ICAgICAgICAgICAgICAg
ICBpZiAoKCpzdHIgPj0gJzAnICYmICpzdHIgPD0gJzknKSB8fCAqc3RyID09ICcsJykKPiBAQCAt
NDA2LDcgKzQwNyw3IEBAIHN0cnVjdCB0dHlfZHJpdmVyICp0dHlfZmluZF9wb2xsaW5nX2RyaXZl
cihjaGFyCj4gKm5hbWUsIGludCAqbGluZSkKPiAgICAgICAgICAgICAgICAgaWYgKCpzdHAgPT0g
J1wwJykKPiAgICAgICAgICAgICAgICAgICAgICAgICBzdHAgPSBOVUxMOwo+Cj4gLSAgICAgICAg
ICAgICAgIGlmICh0dHlfbGluZSA+PSAwICYmIHR0eV9saW5lIDwgcC0+bnVtICYmIHAtPm9wcyAm
Jgo+ICsgICAgICAgICAgICAgICBpZiAodHR5X2xpbmUgPj0gMCAmJiB0dHlfbGluZSA8IHAtPm51
bSAmJiBwLT5vcHMgJiYKPiBjb25zb2xlX2RldmljZSgmaW5kZXgpID09IHAgJiYKPiAgICAgICAg
ICAgICAgICAgICAgIHAtPm9wcy0+cG9sbF9pbml0ICYmICFwLT5vcHMtPnBvbGxfaW5pdChwLCB0
dHlfbGluZSwgc3RwKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlcyA9IHR0eV9kcml2
ZXJfa3JlZl9nZXQocCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgKmxpbmUgPSB0dHlfbGlu
ZTsKPgo+IEkgd2lsbCBzZW5kIHByb3BlciBwYXRjaAo+Cj4gWyAgIDE4Ljg4NTM0OF0gcHJpbnRr
OiBsZWdhY3kgY29uc29sZSBbdHR5UzJdIGRpc2FibGVkCj4gWyAgIDE4Ljg5MDgyMV0gMjgwMDAw
MC5zZXJpYWw6IHR0eVMyIGF0IE1NSU8gMHgyODAwMDAwIChpcnEgPSAyODMsCj4gYmFzZV9iYXVk
ID0gMzAwMDAwMCkgaXMgYSA4MjUwCj4gWyAgIDE4Ljg5OTcyN10gcHJpbnRrOiBsZWdhY3kgY29u
c29sZSBbdHR5UzJdIGVuYWJsZWQKPiBbICAgMTguOTA5NDQwXSBwcmludGs6IGxlZ2FjeSBib290
Y29uc29sZSBbbnMxNjU1MGEwXSBkaXNhYmxlZAo+IFsgICAxOC45MjMyNjNdIG9tYXA4MjUwX3By
b2JlOiByZWdpc3RlciB1YXJ0IDI4MDAwMDAuc2VyaWFsCgpJIHJlYWQgYmV0dGVyIHRoZSBkb2N1
bWVudGF0aW9uIGlzIHRoaXMgY2FuIG5vdCB3b3JrLCBiZWNhdXNlIHRoZQpyZXF1aXJlbWVudCBj
YW4gYmUgYW55IHVhcnQgYW5kIG5vdCB0aGUgY29uc29sZSBvbmUKCk1pY2FoZWwKPgo+IE1pY2hh
ZWwKPiA+Cj4gPiA+IC1Eb3VnCj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gTWljaGFlbCBOYXp6YXJl
bm8gVHJpbWFyY2hpCj4gPiBDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKPiA+
IE0uICszOSAzNDcgOTEzIDIxNzAKPiA+IG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+Cj4gPiBBbWFydWxhIFNvbHV0
aW9ucyBCVgo+ID4gSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTAo+
ID4gVC4gKzMxICgwKTg1IDExMSA5MTcyCj4gPiBpbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4g
PiB3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KPgo+Cj4KPiAtLQo+IE1pY2hhZWwgTmF6emFyZW5v
IFRyaW1hcmNoaQo+IENvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgo+IE0uICsz
OSAzNDcgOTEzIDIxNzAKPiBtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+Cj4gQW1hcnVsYSBTb2x1dGlvbnMgQlYKPiBKb29w
IEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MCj4gVC4gKzMxICgwKTg1IDEx
MSA5MTcyCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IHd3dy5hbWFydWxhc29sdXRpb25z
LmNvbQoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGll
ZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNv
bHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVsYSBT
b2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApU
LiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVs
YXNvbHV0aW9ucy5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2tnZGItYnVncmVwb3J0Cg==
