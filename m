Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D73748AE1F3
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 12:17:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzDDc-0006QN-Ur
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 Apr 2024 10:17:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzDDb-0006QE-Cv
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 10:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WSIhEkyuGlAKLZqnsx6pwNHAFthAMdp875SAIfIKU9Y=; b=ODz0RMh68hARH8eFzQCAe3fK1s
 n3vXM31BUkVSKKG+9hLVOaMtt3+sp3ddEMuvEFbBI0GONf2lZ/FYZHAj8Xke3R24L4l1dKezfeEor
 LWzZereN7Cx5PUhl78iZhALqi9faUmXBp6XFR87qPTm7Ti+oUaC4U7y1g5pfTh2/7QTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WSIhEkyuGlAKLZqnsx6pwNHAFthAMdp875SAIfIKU9Y=; b=CMDa1m5UZHr9sOUEYKGt46TVy2
 3fe203L5tRZ3S5P/cnoTeCIRgLEpRwo7PsB5UoAZXyLgV/jsbIzshiHB8HedsJ4NLVOhSIBPXJW9p
 jUuJH5gY1is3dZDr95nMkuviIMoAA3ciqakZ1yG4XOLVwXRZW9Gz0nhbUO2/KvgJ2jQg=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzDDa-0002nU-QD for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 Apr 2024 10:17:44 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41ac4cd7a1cso2432605e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Apr 2024 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713867456; x=1714472256; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WSIhEkyuGlAKLZqnsx6pwNHAFthAMdp875SAIfIKU9Y=;
 b=oqMiUjxNyRxfKtKXnriNauQ3XljnFcccG3wg2eleXYzNrJx6Nd3rUHb13ruNVcwVe4
 TappdugdAqeeNR4Ld9y46ygSbptib34nsgjnP56YfHOJWHpbMX5l1WtE7XiOQKcnqq4J
 Yctel9uOGZ0kGtRprGIGzfZKj1TCz04ESqiYH/xggIYRFH5jF+KCV5+oMYVsHbzqOANX
 gDFKDM8aDdnW6za/SdIcnqZ01pck6YMbh0QWHJEJN+J7uB24WNGAg5rkMorluhaAcegE
 UW0zfJT1zUfFWj7ZDwPdRp7CSYA2Q8mnUofeqgFvKNFa9go3yra0P8cBG6B7VoR8NPR0
 uO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713867456; x=1714472256;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSIhEkyuGlAKLZqnsx6pwNHAFthAMdp875SAIfIKU9Y=;
 b=EItpnbhN5DjY0fMdqlYYGRJ1+sW8HQ96CZZwyb7WpscRRDqW4PF692D91UQ8x+erlt
 tQ7etxpSVj9sMZ5pZllOQ+o+0Ii8myjWpi/5KkEfl0jNKITM7q2AJDUt7VkeUY39Q2y1
 sDaqxNFA6IEMoWsAts64nPESdWKIGCdniMcCt3IcUQpeYr5UAoAMx7+GVSR6pJ7AHXsz
 p+uIOwwE4u6oKLlGQPrKOTOweYS4XCugYXoD5wPtY2+SN1s7Rdrp0Mrq/FQEyOavKiox
 z7YU/41O3upwl35x+RnhCM5X4LPbxocT743mYwDAO0fJN4khDoJR1EHJWDCuN2lRCSZY
 rxuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4I5XX3N/4R3STgQ51h01ATkabQZDmfQJ5sWCesET3gzFcU0bqnq5ygzAKJ+Aezv7GoYqN9N9DHREsGlYm+kNUVIZzhvQ/ZwkcN/FAT9WJ4v01du0=
X-Gm-Message-State: AOJu0YyuuLx0LkJuzSovtIcLNqkW8OmVDwwKm1Q0oL8yY7PQFZze0bkx
 e8Je9UW9Ngp0wMpn037huuRPdgLwtwgNdd3EOza5efdPF5xihskVcGSEgokxJIU=
X-Google-Smtp-Source: AGHT+IG1QPul9ff/agjnfVb1zx0R1tS4WbYQ6DGw9mfuJGNwEgeOG9LlcF2fpwcDxX4nEz6RCXCQZw==
X-Received: by 2002:a05:600c:5008:b0:41a:81be:3e5e with SMTP id
 n8-20020a05600c500800b0041a81be3e5emr2823760wmr.22.1713867456447; 
 Tue, 23 Apr 2024 03:17:36 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00418d5b16f85sm19577127wmn.21.2024.04.23.03.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 03:17:35 -0700 (PDT)
Date: Tue, 23 Apr 2024 11:17:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20240423101734.GA1567803@aspen.lan>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-1-ed51f7d145fe@linaro.org>
 <CAD=FV=VrOSN8VFaRwH-k4wCLm6Xb=zJyozJac+ijzhDvH8BYxA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VrOSN8VFaRwH-k4wCLm6Xb=zJyozJac+ijzhDvH8BYxA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 22, 2024 at 04:51:49PM -0700, Doug Anderson wrote:
    > Hi, > > On Mon, Apr 22, 2024 at 9:37 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > Currently, when the user attemp [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.128.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.51 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1rzDDa-0002nU-QD
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/7] kdb: Fix buffer overflow during
 tab-complete
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
Cc: kgdb-bugreport@lists.sourceforge.net, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMDQ6NTE6NDlQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIE1vbiwgQXByIDIyLCAyMDI0IGF0IDk6MzfigK9BTSBEYW5pZWwg
VGhvbXBzb24KPiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IEN1
cnJlbnRseSwgd2hlbiB0aGUgdXNlciBhdHRlbXB0cyBzeW1ib2wgY29tcGxldGlvbiB3aXRoIHRo
ZSBUYWIga2V5LCBrZGIKPiA+IHdpbGwgdXNlIHN0cm5jcHkoKSB0byBpbnNlcnQgdGhlIGNvbXBs
ZXRlZCBzeW1ib2wgaW50byB0aGUgY29tbWFuZCBidWZmZXIuCj4gPiBVbmZvcnR1bmF0ZWx5IGl0
IHBhc3NlcyB0aGUgc2l6ZSBvZiB0aGUgc291cmNlIGJ1ZmZlciByYXRoZXIgdGhhbiB0aGUKPiA+
IGRlc3RpbmF0aW9uIHRvIHN0cm5jcHkoKSB3aXRoIHByZWRpY3RhYmx5IGhvcnJpYmxlIHJlc3Vs
dHMuIE1vc3Qgb2J2aW91c2x5Cj4gPiBpZiB0aGUgY29tbWFuZCBidWZmZXIgaXMgYWxyZWFkeSBm
dWxsIGJ1dCBjcCwgdGhlIGN1cnNvciBwb3NpdGlvbiwgaXMgaW4KPiA+IHRoZSBtaWRkbGUgb2Yg
dGhlIGJ1ZmZlciwgdGhlbiB3ZSB3aWxsIHdyaXRlIHBhc3QgdGhlIGVuZCBvZiB0aGUgc3VwcGxp
ZWQKPiA+IGJ1ZmZlci4KPiA+Cj4gPiBGaXggdGhpcyBieSByZXBsYWNpbmcgdGhlIGR1YmlvdXMg
c3RybmNweSgpIGNhbGxzIHdpdGggbWVtbW92ZSgpL21lbWNweSgpCj4gPiBjYWxscyBwbHVzIGV4
cGxpY2l0IGJvdW5kYXJ5IGNoZWNrcyB0byBtYWtlIHN1cmUgd2UgaGF2ZSBlbm91Z2ggc3BhY2UK
PiA+IGJlZm9yZSB3ZSBzdGFydCBtb3ZpbmcgY2hhcmFjdGVycyBhcm91bmQuCj4gPgo+ID4gUmVw
b3J0ZWQtYnk6IEp1c3RpbiBTdGl0dCA8anVzdGluc3RpdHRAZ29vZ2xlLmNvbT4KPiA+IENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBRmhHZDhxRVN1dWlmdUhzTmpGUFItVmEz
UDgwYnhydytMcXZDOGRlQThHemlVSkxwd0BtYWlsLmdtYWlsLmNvbS8KPiA+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmll
bC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAga2VybmVsL2RlYnVnL2tkYi9rZGJf
aW8uYyB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gQm95LCB0aGlzIGZ1bmN0aW9uIChhbmQg
ZXNwZWNpYWxseSB0aGUgdGFiIGhhbmRsaW5nKSBpcyBoYXJkIHRvIHJlYWQuCgpUb28gcmlnaHQu
IEkgZXZlbiByZXdyb3RlIGl0IHVzaW5nIG9mZnNldHMgcmF0aGVyIHRoYW4gcG9pbnRlcnMgYXQg
b25lCnBvaW50IChpdCBkaWRuJ3QgcmVhbGx5IG1ha2UgaXQgbXVjaCBjbGVhcmVyIHNvIEkgZHJv
cHBlZCB0aGF0IGZvciBub3cpLgoKCj4gSSBzcGVudCBhIGJpdCBvZiB0aW1lIHRyeWluZyB0byBn
cm9rIGl0IGFuZCwgYXMgZmFyIGFzIEkgY2FuIHRlbGwsCj4geW91ciBwYXRjaCBtYWtlcyB0aGlu
Z3MgYmV0dGVyIGFuZCBJIGRvbid0IHNlZSBhbnkgYnVncy4KPgo+IFJldmlld2VkLWJ5OiBEb3Vn
bGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgpUaGFua3MhCgpEYW5pZWwuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
