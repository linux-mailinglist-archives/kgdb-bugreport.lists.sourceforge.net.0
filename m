Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F150D9E7409
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  6 Dec 2024 16:27:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tJaEd-0003vh-Co
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 06 Dec 2024 15:27:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tJaEc-0003vb-Kb
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 06 Dec 2024 15:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=; b=Vq0KKy0wXvSApzgVPEdJEFCPiU
 bXbAl/1WXs3XNoYZYjGt8rJAH2hENFGLtMb28xmWG6/PoubWHPjWtT5QvRfwGSehNEqqrd02dAEBC
 KnSb2ApY3MHUnpvbMtxRz5dLMuSl07Tp8b3x9yz8wvFE4YmsCstXmhZmwePnUGxCX+3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=; b=JdOcMWc3GKhakn3gcxn8Cq+0eL
 P78HHwW0Y4UXGybDZNVyKfgrVWsoAc/CgiiVUAQihw3G+neYBgej2BMRA5pweqJlPamNzkp+3fDYU
 Sv37xdFLIN5KBdpMXib5773kiKjckjCxPK7FHj6hZlUx0I7+yCQXZr6dCkw5rf3tgC9w=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tJaEb-0007mR-BV for kgdb-bugreport@lists.sourceforge.net;
 Fri, 06 Dec 2024 15:27:13 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53dde4f0f23so1999889e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 06 Dec 2024 07:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733498824; x=1734103624;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
 b=OZXkpsf93wwBKBDEf+IGs4DI0d06igN04FK7rbxui8vn6tJSeEx+u599PXcN2yDL3m
 j5aLZDFSBaT0+hMxRN5s0opv9pbPR/DqMh/WGTitVp90RD34hLO0mGKmHJaDjTHzyDbJ
 vDhf/0j9l8LvoqByLNvVUtKNxQVJ7zd6Xo/fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733498824; x=1734103624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
 b=OAsILAVefM3dyPnzRErW30V4WybacDDJqhLMD6apTL0jwW+svif7jlVA10wCTCOJDm
 +z7bgXgSCwrtJJWix1OayAzw68TtwRs9aoVbiUoEE8UKxgP8333l51zqJLU02IgW7Fe8
 csdAFjdRp5/r9bNzmoMqm5+erYVozalrM4XsC6RaVX82a6OSnAm3/1fyfjaxz0SqttiO
 1aPq8HbwH/x631zuOR2HQS+n+CISTbBPMEBCFhyUB7hD2Rmj5o/ITjYaEul4wQv1qWZs
 E0PafW1LcYiDq63z6dJO2Fwdr7SVpKtxFovYxZ2b732ktImBa83rvW6UuGkAs9KtsZJh
 Otjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2tw/fFd7D87Iybi5njFQIS3vce+rVt0/ZClriRBm+6Tex3PFcr2Squ3/8PmumVI+HiLyxrvudxYXGpdG2ug==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyvJHXFlBOKG4HGjmlfkxXkCcpI/yUep31JiEziWxI66A+3DWop
 bUvot+bVPKCx5Xv9QHMvF6Bu18VMHb+j3Lyq/6mKClPx9WU5ZZ5XpK/pis6sn2h5f+I/yJRX5Pw
 uAQ==
X-Gm-Gg: ASbGncv/aDkh+MzqLhJGjPMVBjrHSnmWcPV4Hj8BQGHQNoDRRe5YvsU3qF++hA36Gn4
 A9EF2tD3pWydqC7IrQ6+iorkNEsk8njJhB2wT3TdrZosr1QHk4/s5U9wsv6jRXNnk8H1GEYcrEW
 zrfEJ+ZqO5HfGvrn+/lJD7/H78W+8tZIVaV35xHsJGrZl+MLJ7sN5pToAgIC3upMBXkcoLEA4Ka
 yzqz7ZKhuVQT0Dz3QonMMsPwz9+vpkOgwqy9VdNTEb3iwhBfvKCI4wFyERnRJJEDp2MAVhdCf+f
 Y+ZAfALrWzuxlQM82g==
X-Google-Smtp-Source: AGHT+IFZ3UibAVKpkB7Z9L00CVMiDfp7+SUaHhH9KPcxweHdLbgEdD6MtsXloIfp0+BCZ3bpZzMaSg==
X-Received: by 2002:a05:6512:308d:b0:53e:21c7:9f30 with SMTP id
 2adb3069b0e04-53e2c30e952mr1230898e87.54.1733498823797; 
 Fri, 06 Dec 2024 07:27:03 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3115cb25sm175459e87.56.2024.12.06.07.27.02
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 07:27:02 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso22687331fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 06 Dec 2024 07:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX60pxUV/yPabJJ5B0Bqx7GJ9GL1FAxChqXpzATtp+y9A8benSvzZTujVLvr0DPxqiCUoZxui+wHLf3+IfNYg==@lists.sourceforge.net
X-Received: by 2002:a05:651c:2119:b0:300:18ed:4313 with SMTP id
 38308e7fff4ca-3002f8bd5ecmr10190331fa.9.1733498821759; Fri, 06 Dec 2024
 07:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20241206003100.38142-1-rdunlap@infradead.org>
In-Reply-To: <20241206003100.38142-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Dec 2024 07:26:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Dec 5, 2024 at 4:31 PM Randy Dunlap <rdunlap@infradead.org>
    wrote: > > Move gdb and kgdb debugging documentation to the dedicated > debugging
    directory (Documentation/process/debugging/). > [...] 
 
 Content analysis details:   (-3.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.49 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.49 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tJaEb-0007mR-BV
Subject: Re: [Kgdb-bugreport] [PATCH v2] Documentation: move dev-tools
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
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-serial@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Thompson <danielt@kernel.org>, workflows@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Hu Haowen <2023002089@link.tyut.edu.cn>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIERlYyA1LCAyMDI0IGF0IDQ6MzHigK9QTSBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBNb3ZlIGdkYiBhbmQga2dkYiBkZWJ1Z2dpbmcg
ZG9jdW1lbnRhdGlvbiB0byB0aGUgZGVkaWNhdGVkCj4gZGVidWdnaW5nIGRpcmVjdG9yeSAoRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL2RlYnVnZ2luZy8pLgo+IEFkanVzdCB0aGUgaW5kZXgucnN0IGZp
bGVzIHRvIGZvbGxvdyB0aGUgZmlsZSBtb3ZlbWVudC4KPiBBZGp1c3QgZmlsZXMgdGhhdCByZWZl
ciB0byB0aGVzZSBtb3ZlZCBmaWxlcyB0byBmb2xsb3cgdGhlIGZpbGUgbW92ZW1lbnQuCj4gVXBk
YXRlIGxvY2F0aW9uIG9mIGtnZGIucnN0IGluIE1BSU5UQUlORVJTIGZpbGUuCj4KPiBOb3RlOiB0
cmFuc2xhdGlvbnMgYXJlIG5vdCB1cGRhdGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVu
bGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IFNlYmFzdGlhbiBGcmlja2UgPHNlYmFz
dGlhbi5mcmlja2VAY29sbGFib3JhLmNvbT4KPiBDYzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRA
bHduLm5ldD4KPiBDYzogd29ya2Zsb3dzQHZnZXIua2VybmVsLm9yZwo+IENjOiBKYXNvbiBXZXNz
ZWwgPGphc29uLndlc3NlbEB3aW5kcml2ZXIuY29tPgo+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRh
bmllbHRAa2VybmVsLm9yZz4KPiBDYzogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21p
dW0ub3JnPgo+IENjOiBsaW51eC1kZWJ1Z2dlcnNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGtnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IENjOiBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPgo+IENj
OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+Cj4gQ2M6IEh1IEhhb3dlbiA8MjAy
MzAwMjA4OUBsaW5rLnR5dXQuZWR1LmNuPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4
LWZvdW5kYXRpb24ub3JnPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgo+IENjOiBsaW51eC1zZXJpYWxAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4g
djI6IE1ha2UgcHJvY2Vzcy9kZWJ1Z2dpbmcvaW5kZXggYWxwaGEgYnkgZmlsZW5hbWUuCj4gICAg
IFVwZGF0ZSByZWZlcmVuY2VzIHRvIHRoZSBtb3ZlZCBmaWxlcy4KPgo+ICBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL1JFQURNRS5yc3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICsrLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvaW5kZXgucnN0ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAtLQo+ICAuLi4ve2Rldi10b29scyA9PiBwcm9j
ZXNzL2RlYnVnZ2luZ30vZ2RiLWtlcm5lbC1kZWJ1Z2dpbmcucnN0ICAgICAgICAgfCAwCj4gIERv
Y3VtZW50YXRpb24vcHJvY2Vzcy9kZWJ1Z2dpbmcvaW5kZXgucnN0ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKysKPiAgRG9jdW1lbnRhdGlvbi97ZGV2LXRvb2xzID0+IHByb2Nlc3Mv
ZGVidWdnaW5nfS9rZ2RiLnJzdCAgICAgICAgICAgICAgIHwgMAo+ICBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCj4gIGluY2x1ZGUvbGludXgvdHR5X2RyaXZlci5oICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgbGliL0tjb25maWcuZGVidWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBsaWIv
S2NvbmZpZy5rZ2RiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCj4gIDkgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tn
ZGItYnVncmVwb3J0Cg==
