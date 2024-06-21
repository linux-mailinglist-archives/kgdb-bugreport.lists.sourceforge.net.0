Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCF912A86
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 17:44:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKgQi-0008Ps-JD
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 15:44:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sKgQh-0008PY-HC
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XUHa9iYEbZvmgzqh1U+eUfosgSvcbfpDBPY5qT8YXp8=; b=mN0hDdce0Oj21OmjJQn0WxN/Pz
 qfvOu2sIvXy+A/eLDxGbTZD90b3xZT6tjPTFZGEiXTSG4HzTx1pC3NGlnsrUi8BxvMLBikg/ThVRo
 OZBmgD2PItP0QmozinRBzVrFLD0RdkJ3hKWi0dpyszW64N7H7wbORQRccpEUs/Sxkqv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XUHa9iYEbZvmgzqh1U+eUfosgSvcbfpDBPY5qT8YXp8=; b=j4WMEqZlFNAJz8XTDnnIItoqeE
 2McnsZ1O955HPq81R7gU/nhq4mnLXaMfJZOfj/7H6m5CsHNm3CTR3vbMU4n8ovap0A03Xr7PDplVd
 8ZaDEV29RXYlAbndcX91zzEIjqLs0OnO1LVuf5mYjBwKUlnmUvV8Gcx50eZ/1S4ECPRU=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKgQh-00047Z-2l for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:43:59 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-421a1b834acso18277005e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718984632; x=1719589432; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XUHa9iYEbZvmgzqh1U+eUfosgSvcbfpDBPY5qT8YXp8=;
 b=eVrGJ0X5zpGVkOnZhvVE7WVR/HKEjZKHmghE/zcIX1yABohRj8H/oNKCW6d1zWagj/
 z0tH/PJ0K9b0NoqPmtRTsMy/1cldkUwWTCpaz67Rk44tjD1foWGlOoLMY+HaaB7N6BIg
 JakXWYcvK+gM4LtbZyVNniVdjwOFdUcd6m6vI7Hwr1oKlU44ZSNOB8vXMpmRN4j62HJ6
 Cf4Dgdo3m8Vbx8PWLrjF386kKgIjnDLs9XEQhfGey/+NCQTkh+6A6+7L4bi/J+OuZjrS
 5eP6xE4hpR6r1DQDKaaI8c1x4KWfuux4VCiw5GujDEOw7DSn4w+JnKbDgoYi4Ah54DvB
 0Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984632; x=1719589432;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XUHa9iYEbZvmgzqh1U+eUfosgSvcbfpDBPY5qT8YXp8=;
 b=sTqlh9Ff4EXN0ucDsrjJepUimy1SxknOCKsg6qis5+vqaUsEnUmVtRk3mPL+51kMdG
 ABa3fioe+UwpI23kzyhPubcC6xcdgmwLj6+husZ/5q7hrBZ9c4+6PgA5S5I9s/xbJ86o
 F/tGwrpAHmtn8pf7nReIm4Gjw3/VPAmbEsvk6PD2wN8iGsEaB+3o/pDewsjS/QaN72YZ
 VU/pzlp2WNXtJK78bVoEO4gN59hxbAhMbZsz7l2mnyUrqXosPGc6Suh2NSZCp4UeFhif
 QowQg0/BXGrLwrF4uWdbtAo0LbfHqot/ScF4ayQZOLUhyZdeJeI16MKZTgBpOgSSn+hO
 AMew==
X-Gm-Message-State: AOJu0Yxv3JiT9IShHH3G9K5+sDZwyHqFUGYwkw8ugvv3ZmRcyeRIYtbw
 AXeyauFegOLF9Q58odMP0WnnBXaRJtcLxS94FxNAtb86+Qa5jRrncqde+5OLr0o=
X-Google-Smtp-Source: AGHT+IG1+aVWE3k4wUAufsZwNZBqBkpcs8JXEc/TgfjSz4jxP8MTMZYu5EooJRNN1bRl8zXXiNm5ew==
X-Received: by 2002:a7b:c8ce:0:b0:422:1446:372 with SMTP id
 5b1f17b1804b1-424752968e6mr63883745e9.27.1718984631762; 
 Fri, 21 Jun 2024 08:43:51 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817a9975sm32075185e9.14.2024.06.21.08.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:43:51 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:43:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20240621154349.GE285771@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.13.I572fb3cf62fae1e728dd154081101ae264dc3670@changeid>
 <20240618155938.GG11330@aspen.lan>
 <CAD=FV=VTegKBcHY9pgfFUs7T1Ug5r1yg+CxLE6sBhBBt4csfkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VTegKBcHY9pgfFUs7T1Ug5r1yg+CxLE6sBhBBt4csfkw@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 18, 2024 at 12:33:05PM -0700, Doug Anderson wrote:
    > Hi, > > On Tue, Jun 18, 2024 at 8:59 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > On Mon, Jun 17, 2024 at 05:34:4 [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.128.49 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.49 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.49 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.49 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1sKgQh-00047Z-2l
Subject: Re: [Kgdb-bugreport] [PATCH 13/13] kdb: Add mdi,
 mdiW / mdiWcN commands to show iomapped memory
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgMTI6MzM6MDVQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDI0IGF0IDg6NTnigK9BTSBEYW5pZWwg
VGhvbXBzb24KPiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IE1vbiwgSnVuIDE3LCAyMDI0IGF0IDA1OjM0OjQ3UE0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24g
d3JvdGU6Cj4gPiA+IEFkZCBjb21tYW5kcyB0aGF0IGFyZSBsaWtlIHRoZSBvdGhlciAibWQiIGNv
bW1hbmRzIGJ1dCB0aGF0IGFsbG93IHlvdQo+ID4gPiB0byByZWFkIG1lbW9yeSB0aGF0J3MgaW4g
dGhlIElPIHNwYWNlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gU29ycnkgdG8gYmUgdGhlIGJlYXJlciBv
ZiBiYWQgbmV3cyBidXQuLi4KPiA+Cj4gPgo+ID4gPiAtLS0KPiA+ID4gPHNuaXA+Cj4gPiA+ICsv
Kgo+ID4gPiArICoga2RiX2dldGlvd29yZAo+ID4gPiArICogSW5wdXRzOgo+ID4gPiArICogICB3
b3JkICAgIFBvaW50ZXIgdG8gdGhlIHdvcmQgdG8gcmVjZWl2ZSB0aGUgcmVzdWx0Lgo+ID4gPiAr
ICogICBhZGRyICAgIEFkZHJlc3Mgb2YgdGhlIGFyZWEgdG8gY29weS4KPiA+ID4gKyAqICAgc2l6
ZSAgICBTaXplIG9mIHRoZSBhcmVhLgo+ID4gPiArICogUmV0dXJuczoKPiA+ID4gKyAqICAgMCBm
b3Igc3VjY2VzcywgPCAwIGZvciBlcnJvci4KPiA+ID4gKyAqLwo+ID4gPiAraW50IGtkYl9nZXRp
b3dvcmQodW5zaWduZWQgbG9uZyAqd29yZCwgdW5zaWduZWQgbG9uZyBhZGRyLCBzaXplX3Qgc2l6
ZSkKPiA+ID4gK3sKPiA+ID4gKyAgICAgdm9pZCBfX2lvbWVtICptYXBwZWQgPSBpb3JlbWFwKGFk
ZHIsIHNpemUpOwo+ID4KPiA+IGlvcmVtYXAoKSBpcyBhIG1pZ2h0X3NsZWVwKCkgZnVuY3Rpb24u
IEl0J3MgdW5zYWZlIHRvIGNhbGwgaXQgZnJvbSB0aGUKPiA+IGRlYnVnIHRyYXAgaGFuZGxlci4K
Pgo+IEhtbW1tLiBEbyB5b3UgaGF2ZSBhIHBvaW50ZXIgdG8gZG9jdW1lbnRhdGlvbiBvciBjb2Rl
IHNob3dpbmcgdGhhdAo+IGl0J3MgYSBtaWdodF9zbGVlcCgpIGZ1bmN0aW9uLiBJIHdhcyB3b3Jy
aWVkIGFib3V0IHRoaXMgaW5pdGlhbGx5IGJ1dAo+IEkgY291bGRuJ3QgZmluZCBhbnkgZG9jdW1l
bnRhdGlvbiBvciBjb2RlIGluZGljYXRpbmcgaXQgdG8gYmUgc28uIEkKPiBhbHNvIGdvdCBubyB3
YXJuaW5ncyB3aGVuIEkgcmFuIG15IHByb3RvdHlwZSBjb2RlIGFuZCB0aGVuIHRoZSBjb2RlCj4g
d29ya2VkIGZpbmUsIHNvIEkgYXNzdW1lZCB0aGF0IGl0IG11c3Qgc29tZWhvdyB3b3JrLiBTaWdo
Li4uCj4KPiBMb29raW5nIG1vcmUgY2xvc2VseSwgbWF5YmUgdGhpcyBpczoKPgo+IGlvcmVtYXAo
KSAtPiBpb3JlbWFwX3Byb3QoKSAtPiBnZW5lcmljX2lvcmVtYXBfcHJvdCgpIC0+Cj4gX19nZXRf
dm1fYXJlYV9jYWxsZXIoKSAtPiBfX2dldF92bV9hcmVhX25vZGUoKSAtPiBfX2dldF92bV9hcmVh
X25vZGUoKQo+Cj4gLi4uYW5kIHRoYXQgaGFzIGEga2VybmVsIGFsbG9jYXRpb24gd2l0aCBHRlBf
S0VSTkVMPwoKVG8gYmUgaG9uZXN0IHRoZXJlIHdlcmUgYSBsb3Qgb2YgcHJvYmxlbXMsIEkganVz
dCBzaW1wbGlmaWVkLgoKX19nZXRfdm1fYXJlYV9ub2RlKCkgYWxyZWFkeSBjb21tZW5jZXMgd2l0
aCBhIEJVR19PTihpbl9pbnRlcnJ1cHQoKSkKYmVmb3JlIGl0IGVuZHMgdXAgZG9pbmcgYSBHRlBf
S0VSTkVMIG1lbW9yeSBhbGxvY2F0aW9uLgoKSSB0aGluayB0aGVyZSBhcmUgbXVsdGlwbGUgY2Fs
bHMgdG8gbWlnaHRfc2xlZXAoKSAoZm9yIGV4YW1wbGUgZnJvbQpfX2dldF92bV9hcmVhX25vZGUo
KSAtPiBhbGxvY192bWFwX2FyZWEoKSApLgoKSG93ZXZlciBldmVuIGlmIHdlIGhhZCBwcmVhbGxv
Y2F0ZWQgc29tZSB2bWFwIGFkZHJlc3NlcyBmb3IgcGVlay9wb2tlCnRoZXJlIGFyZSBzdGlsbCBw
cm9ibGVtcyBpbiBpb3JlbWFwX3BhZ2VfcmFuZ2UoKSB0b28uIEZvciBleGFtcGxlOgoKZ2VuZXJp
Y19pb3JlbWFwX3Byb3QoKQogIC0+IGlvcmVtYXBfcGFnZV9yYW5nZSgpCiAgICAtPiBmaW5kX3Zt
X2FyZWEoKQogICAgICAtPiBmaW5kX3ZtYXBfYXJlYSgpCiAgICAgICAgLT4gc3Bpbl9sb2NrKCkK
CldlIGNvdWxkIGdvIGZ1cnRoZXIgZG93biB0aGUgcmFiYml0IGhvbGUgYW5kIHByZS1sb29rdXAg
dGhlIFZNIGFyZWEgdG9vCmJ1dCB0aGVuIHdlIGhpdC4KCmdlbmVyaWNfaW9yZW1hcF9wcm90KCkK
ICAtPiBpb3JlbWFwX3BhZ2VfcmFuZ2UoKQogICAgLT4gdm1hcF9wYWdlX3JhbmdlKCkKICAgICAg
LT4gdm1hcF9yYW5nZV9ub2ZsdXNoKCkKICAgICAgICAtPiBtaWdodF9zbGVlcCgpCgpJdCBpcyBy
ZW1vdGVseSBwb3NzaWJsZSB0aGF0IHRoZSBvbmx5IGxvY2sgdm1hcF9wYWdlX3JhbmdlKCkgdGFr
ZXMgaXMKaW5pdF9tbS0+cGFnZV90YWJsZV9sb2NrIGJ1dCBJIGRvdWJ0IHdlIGNhbiBiZSBzdXJl
IG9mIHRoYXQuCgoKPiBJIGd1ZXNzIGl0IGFsc28gdGhlbiBjYWxscyBhbGxvY192bWFwX2FyZWEo
KSAgd2hpY2ggaGFzIG1pZ2h0X3NsZWVwKCkuLi4KPgo+IEknbGwgaGF2ZSB0byB0cmFjayBkb3du
IHdoeSBubyB3YXJuaW5ncyB0cmlnZ2VyZWQuLi4KPgo+ID4gSSdtIGFmcmFpZCBJIGRvbid0IGtu
b3cgYSBzYWZlIGFsdGVybmF0aXZlIGVpdGhlci4gTWFjaGluYXJ5IHN1Y2ggYXMKPiA+IGttYXBf
YXRvbWljKCkgbmVlZHMgYSBwYWdlIGFuZCBpb21lbSB3b24ndCBoYXZlIG9uZS4KPgo+IFVnaC4g
SXQgd291bGQgYmUgbmljZSB0byBjb21lIHVwIHdpdGggc29tZXRoaW5nIHNpbmNlIGl0J3Mgbm90
Cj4gdW5jb21tb24gdG8gbmVlZCB0byBsb29rIGF0IHRoZSBzdGF0ZSBvZiBoYXJkd2FyZSByZWdp
c3RlcnMgd2hlbiBhCj4gY3Jhc2ggaGFwcGVucy4gSW4gdGhlIHBhc3QgSSd2ZSBtYW5hZ2VkIHRv
IGdldCBpbnRvIGdkYiwgdHJhY2sgZG93biBhCj4gZ2xvYmFsIHZhcmlhYmxlIHdoZXJlIHNvbWVv
bmUgaGFzIGFscmVhZHkgbWFwcGVkIHRoZSBtZW1vcnksIGFuZCB0aGVuCj4gdXNlIGdkYiB0byBs
b29rIGF0IHRoZSBtZW1vcnkuIEl0J3MgYWx3YXlzIGEgYmlnIHBhaW4sIHRob3VnaC4uLgo+Cj4g
Li4uZXZlbiBpZiBJIGNvdWxkIGp1c3QgbG9vayB1cCB0aGUgdmlydHVhbCBhZGRyZXNzIHdoZXJl
IHNvbWVvbmUgZWxzZQo+IGhhZCBhbHJlYWR5IG1hcHBlZCBpdCB0aGF0IG1pZ2h0IGJlIGVub3Vn
aC4gQXQgbGVhc3QgSSB3b3VsZG4ndCBuZWVkCj4gdG8gZ28gdHJhY2sgZG93biB0aGUgZ2xvYmFs
cyBteXNlbGYuLi4KPgo+IC4uLmFueXdheSwgSSBndWVzcyBJJ2xsIHBvbmRlciBvbiBpdCBhbmQg
cG9rZSBpZiBJIGhhdmUgdGltZS4uLgoKSSd2ZSBvZnRlbiB0aG91Z2h0IGFib3V0IGltcGxlbWVu
dGluZyBsb25nam1wLW9uLXNwaW4td2FpdCBmb3Iga2dkYiBmb3IKdGhlc2Uga2luZCBvZiByZWFz
b25zLiBGb3IgZXhhbXBsZSBJIGhhdmUgbG9uZyB3YW50ZWQgdG8gYmUgYWJsZSB0byBsZXQKdGhl
IHVzZXIgc2VlIC9wcm9jL2ludGVycnVwdHMgYmVmb3JlIHRoZSB1c2VzcGFjZSBjb21lcyB1cCBi
dXQgdGhlIHNwaW4KbG9ja3MgZ2V0IGluIHRoZSB3YXkuCgpUaGlzIGFwcHJvYWNoIHdvdWxkbid0
IG1ha2UgY2FsbGluZyBpb3JlbWFwKCkgc2FmZSAoc2luY2Ugd2UgY291bGQgZW5kCnVwIGJhaWxp
bmcgb3V0IGhhbGZ3YXkgdGhyb3VnaCBhIG5vbi1hdG9taWMgb3BlcmF0aW9uKSBidXQgaXQgY291
bGQgYXQKbGVhc3QgZ2l2ZSBjb250cm9sIGJhY2sgdG8ga2RiIGFuZCBsZXQgdGhlIHVzZXIga25v
dyB0aGV5IGhhdmUgcnVpbmVkCnRoZWlyIHN5c3RlbS4KCkkga25vdy4uLiB0aGVyZSBpcyBhICpy
ZWFzb24qIEkndmUgbmV2ZXIgcXVpdGUgZ290IHJvdW5kIHRvIHdyaXRpbmcKdGhpcyEKCgpEYW5p
ZWwuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dk
Yi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1
Z3JlcG9ydAo=
