Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A3807394
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Dec 2023 16:17:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rAtet-0005xg-Su
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Dec 2023 15:17:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rAtes-0005xW-AN
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Dec 2023 15:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZJM1Env+eEXFazDQzwu0LsFevasaND9E0B7qCoSTyU=; b=OEcMqBqVfui19Hxfkw/mgmHRSD
 Hxq0FNHK6qaMccq/pbxC9hnhG/JWNy9E2ihH2vuTzWnaSZqgzR3jd/ycvkGVFdldomZYs+0lQ5dn2
 vtKjJYAZu8Tsgu/eFPhlk6MN+HJal9OhLhTVYXzCyJnLhIOWaFIu0rRLZwEw9mNSNyqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zZJM1Env+eEXFazDQzwu0LsFevasaND9E0B7qCoSTyU=; b=TIm1cGfg+hmBJGw1ZssAZFRBh+
 04ZownjqnlNdlHaSvA0tyFripW8akZyElG9d7bXuylh/6KZdu8mS0C3qXNLWYenKVq0EPTjr4J0+T
 Nw2EdBKsZQgFLqzRbc8Z0fj1d5MK0bLt7g2UsIz9C7oHXOIPKETri7/U57ji6jTD7Las=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAtep-0005Tw-DC for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Dec 2023 15:17:53 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-54c77e0832cso5800493a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Dec 2023 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701875864; x=1702480664;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZJM1Env+eEXFazDQzwu0LsFevasaND9E0B7qCoSTyU=;
 b=Ty76tXFVXaTc1DV2iM4eFfIDcTBNyRnPN1Lhv1zcJGCVJFcdHOlwHCMghnDqhjJsk9
 k1+wms0J3ub7/O7mOKmvkFtgx33h7I3SxQFwLvIqPWL34w1g3nlXkI4Mr1Bcr6ahEda1
 oSLUYGRjre3YOO7fBBb7syUXsaB1s0kHuCyJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701875864; x=1702480664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZJM1Env+eEXFazDQzwu0LsFevasaND9E0B7qCoSTyU=;
 b=nwupEGW/j7qp3p6/N+AMIbbH45GCgYF/EZSauEbV/xWRDHNFKkaAZGt1IMFDxhROOz
 agCMxEit601RLmisVIe8tGi/qGaoR5NhdxYLSmaUaBAV0dUKdqZolVcWCdz4s1nF+1C8
 q1nqYuhNY6dSRm4eClf4dqRq/TBk4E5ZEprT/kPGI9Yf+KHASwenLlmUi1tz/7JqVIMJ
 yo+y6uKzFAXTf0SJTD8rl4nCO9awoX5ka2f8pwTPs/KSxJaA/zULZrm8jIiCuZsFz0AU
 YNZYHu/6YCdPUdt5GTg5aQ7pbimEJUpND1z4Ie5/TbOzNN0AIa8GtgJyzgjpc01PhMTx
 OJDA==
X-Gm-Message-State: AOJu0YxebzQ0XkzgVIDkAgTFu8R0JYpiV84UGs9EbBrgTY82UoIdl5sV
 4qWMc790gu2ql7v2uII5ah7cik6PzEEiHSnkt5FPkfyi
X-Google-Smtp-Source: AGHT+IHkag4wVs6zReo+GQN5sgmomtKXETq1tAS+qEfIS8FUgwueayr9brvbtv0goRcsZT4yNhdQlw==
X-Received: by 2002:aa7:c485:0:b0:54c:4837:93f7 with SMTP id
 m5-20020aa7c485000000b0054c483793f7mr508918edq.62.1701875863758; 
 Wed, 06 Dec 2023 07:17:43 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 c4-20020a056402120400b0054b3d8e65d7sm83941edw.47.2023.12.06.07.17.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 07:17:43 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40b35199f94so76955e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Dec 2023 07:17:43 -0800 (PST)
X-Received: by 2002:a05:600c:3b22:b0:40b:4355:a04b with SMTP id
 m34-20020a05600c3b2200b0040b4355a04bmr89811wms.6.1701875862555; Wed, 06 Dec
 2023 07:17:42 -0800 (PST)
MIME-Version: 1.0
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
 <20231206113753.GB81045@aspen.lan>
In-Reply-To: <20231206113753.GB81045@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Dec 2023 07:17:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7K5d8Dg+W5qaB_Kg8LuzMdMFEKZ2FfFC3qp2xAPMfKA@mail.gmail.com>
Message-ID: <CAD=FV=W7K5d8Dg+W5qaB_Kg8LuzMdMFEKZ2FfFC3qp2xAPMfKA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Dec 6, 2023 at 3:38 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Tue, Dec 05, 2023 at 01:41:57PM -0800, Doug Anderson wrote:
    > > Hi, > > > > On Sun, Nov 19, 2023 at 4:10 P [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.42 listed in list.dnswl.org]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rAtep-0005Tw-DC
Subject: Re: [Kgdb-bugreport] [PATCH 2/2] trace: kdb: Replace simple_strtoul
 with kstrtoul in kdb_ftdump
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
 rostedt@goodmis.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIERlYyA2LCAyMDIzIGF0IDM6MzjigK9BTSBEYW5pZWwgVGhvbXBzb24KPGRh
bmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgRGVjIDA1LCAyMDIz
IGF0IDAxOjQxOjU3UE0gLTA4MDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4g
PiBPbiBTdW4sIE5vdiAxOSwgMjAyMyBhdCA0OjEw4oCvUE0gWXVyYW4gUGVyZWlyYSA8eXVyYW4u
cGVyZWlyYUBob3RtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoZSBmdW5jdGlvbiBzaW1w
bGVfc3RydG91bCBwZXJmb3JtcyBubyBlcnJvciBjaGVja2luZyBpbiBzY2VuYXJpb3MKPiA+ID4g
d2hlcmUgdGhlIGlucHV0IHZhbHVlIG92ZXJmbG93cyB0aGUgaW50ZW5kZWQgb3V0cHV0IHZhcmlh
YmxlLgo+ID4gPiBUaGlzIHJlc3VsdHMgaW4gdGhpcyBmdW5jdGlvbiBzdWNjZXNzZnVsbHkgcmV0
dXJuaW5nLCBldmVuIHdoZW4gdGhlCj4gPiA+IG91dHB1dCBkb2VzIG5vdCBtYXRjaCB0aGUgaW5w
dXQgc3RyaW5nIChha2EgdGhlIGZ1bmN0aW9uIHJldHVybnMKPiA+ID4gc3VjY2Vzc2Z1bGx5IGV2
ZW4gd2hlbiB0aGUgcmVzdWx0IGlzIHdyb25nKS4KPiA+ID4KPiA+ID4gT3IgYXMgaXQgd2FzIG1l
bnRpb25lZCBbMV0sICIuLi5zaW1wbGVfc3RydG9sKCksIHNpbXBsZV9zdHJ0b2xsKCksCj4gPiA+
IHNpbXBsZV9zdHJ0b3VsKCksIGFuZCBzaW1wbGVfc3RydG91bGwoKSBmdW5jdGlvbnMgZXhwbGlj
aXRseSBpZ25vcmUKPiA+ID4gb3ZlcmZsb3dzLCB3aGljaCBtYXkgbGVhZCB0byB1bmV4cGVjdGVk
IHJlc3VsdHMgaW4gY2FsbGVycy4iCj4gPiA+IEhlbmNlLCB0aGUgdXNlIG9mIHRob3NlIGZ1bmN0
aW9ucyBpcyBkaXNjb3VyYWdlZC4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCByZXBsYWNlcyBhbGwg
dXNlcyBvZiB0aGUgc2ltcGxlX3N0cnRvdWwgd2l0aCB0aGUgc2FmZXIKPiA+ID4gYWx0ZXJuYXRp
dmVzIGtzdHJ0b2ludCBhbmQga3N0cnRvbC4KPiA+ID4KPiA+ID4gWzFdIGh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3NpbXBsZS1z
dHJ0b2wtc2ltcGxlLXN0cnRvbGwtc2ltcGxlLXN0cnRvdWwtc2ltcGxlLXN0cnRvdWxsCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1cmFuIFBlcmVpcmEgPHl1cmFuLnBlcmVpcmFAaG90bWFp
bC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAga2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jIHwgMTQgKysr
KysrLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvdHJhY2UvdHJhY2Vfa2Ri
LmMgYi9rZXJuZWwvdHJhY2UvdHJhY2Vfa2RiLmMKPiA+ID4gaW5kZXggNTk4NTdhMWVlNDRjLi4z
ODkxZjg4NWU0YTYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2tlcm5lbC90cmFjZS90cmFjZV9rZGIuYwo+
ID4gPiArKysgYi9rZXJuZWwvdHJhY2UvdHJhY2Vfa2RiLmMKPiA+ID4gQEAgLTk2LDIzICs5Niwy
MSBAQCBzdGF0aWMgaW50IGtkYl9mdGR1bXAoaW50IGFyZ2MsIGNvbnN0IGNoYXIgKiphcmd2KQo+
ID4gPiAgewo+ID4gPiAgICAgICAgIGludCBza2lwX2VudHJpZXMgPSAwOwo+ID4gPiAgICAgICAg
IGxvbmcgY3B1X2ZpbGU7Cj4gPiA+IC0gICAgICAgY2hhciAqY3A7Cj4gPiA+ICsgICAgICAgaW50
IGVycjsKPiA+ID4gICAgICAgICBpbnQgY250Owo+ID4gPiAgICAgICAgIGludCBjcHU7Cj4gPiA+
Cj4gPiA+ICAgICAgICAgaWYgKGFyZ2MgPiAyKQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJu
IEtEQl9BUkdDT1VOVDsKPiA+ID4KPiA+ID4gLSAgICAgICBpZiAoYXJnYykgewo+ID4gPiAtICAg
ICAgICAgICAgICAgc2tpcF9lbnRyaWVzID0gc2ltcGxlX3N0cnRvbChhcmd2WzFdLCAmY3AsIDAp
Owo+ID4gPiAtICAgICAgICAgICAgICAgaWYgKCpjcCkKPiA+ID4gKyAgICAgICBpZiAoYXJnYykK
PiA+ID4gKyAgICAgICAgICAgICAgIGlmIChrc3RydG9pbnQoYXJndlsxXSwgMCwgJnNraXBfZW50
cmllcykpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHNraXBfZW50cmllcyA9IDA7Cj4g
PiA+IC0gICAgICAgfQo+ID4KPiA+IFNpbWlsYXIgbml0IGFib3V0IGJyYWNlcyBhcyBpbiBwYXRj
aCAjMS4gdGw7ZHIgaXMgY2hhbmdlIHRoZSBhYm92ZSB0bzoKPiA+Cj4gPiBpZiAoYXJnYyAmJiBr
c3RydG9pbnQoYXJndlsxXSwgMCwgJnNraXBfZW50cmllcykpCj4gPiAgIHNraXBfZW50cmllcyA9
IDA7Cj4KPiBTdXJlbHkgdGhhdCBzaG91bGQgYmU6Cj4KPiBpZiAoLi4uKQo+ICAgICAgICAgcmV0
dXJuIEtEQl9CQURJTlQ7Cj4KPiBUaGVyZSBzZWVtcyBsaXR0bGUgcG9pbnQgc3dpdGNoaW5nIHRv
IGEgInNhZmVyIiBBUEkgaWYgd2UganVzdCBpZ25vcmUgdGhlCj4gZXJyb3JzIGl0IHByb3ZpZGVz
IHVzLgoKQWgsIHN1cmUuIEkgaGF2ZSBubyBvYmplY3Rpb25zIHRvIHRoYXQuIE5vdGUgdGhhdCB3
b3VsZCBoYXZlIGFsc28gYmVlbgpwb3NzaWJsZSB3aXRoIHRoZSBvbGQgY29kZSwgd2hpY2ggZGlk
IHN0aWxsIGRvIGF3a3dhcmQgZXJyb3IgY2hlY2tpbmcsCnNvIEkgYXNzdW1lZCB0aGF0IGl0IHdh
cyBhIGNvbnNjaW91cyBkZWNpc2lvbi4gLi4uYnV0IEknbSBkZWZpbml0ZWx5CmhhcHBpZXIgd2l0
aCB0aGUgZXJyb3IgYmVpbmcgcmVwb3J0ZWQgaW5zdGVhZCBvZiBnbG9zc2VkIG92ZXIuCgotRG91
ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGIt
YnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdy
ZXBvcnQK
