Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E483806F9F
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Dec 2023 13:27:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rAqzl-0005Jo-FY
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Dec 2023 12:27:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rAqzj-0005Je-PY
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Dec 2023 12:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UsKZRR7fb35TZGm9xzU+NNHL9tg4Q2nzB0Mt74LhSX4=; b=XZLYn2Z+pDVmz3NhtAcBuybKxx
 SJ6TN4Uzqm0+ciQcJ8/I26yGE1m3/JPFrKCWFLT0qVMWXklAxFlA7NzzK2FUdp8ekBFv0z3h6YDXF
 AX5FXdX6ZkM1rogYBIndtnsFOZzwYn7rfKDZP4E04xn68OVShNYRD+97I7YMqOUGK18M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UsKZRR7fb35TZGm9xzU+NNHL9tg4Q2nzB0Mt74LhSX4=; b=T+s1khrmnPaEaWpumJgs5zy7pI
 o5H056WHKc7HJ5Tv8y3s9HHfyNWWibwPqKeElyO/W/ydXLnmpCNpEeoXtnUezS4oYg1bI8Qgk1mXi
 iOEgAf/FJhV2xc7RrRXWWyCJnbybrTZPFey3gfZWJZ3/lf6VQnDwCcP1hiCgi/8OxW0k=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAqzc-000386-IQ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Dec 2023 12:27:16 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-54cae99a48aso1726325a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Dec 2023 04:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701865622; x=1702470422; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UsKZRR7fb35TZGm9xzU+NNHL9tg4Q2nzB0Mt74LhSX4=;
 b=w/AwXV0G5bu9lxJyNi5hsqiBQAf6Ju9n+/Z2vh2p0iT1Vvk1Go6KliguTvoBaQTHnR
 IaDCewhuzPjVWiOvCOMNrUeBSqQgRZBY9npgMaHDXMe4pyHSpMylscd1IntZGNM6fGVu
 efG+YtrThf9N8JLBeZjnFXeMz4yNeFHpmsndF1oB8ALgANPK1NzihLVjH3IgDeHlteoi
 9oudmodNJZaCJVxOHYYp3k3rpsGwRHF5qylEMOtnTETsPIBeUAjwxBVgZYk/sCKWUCgk
 zq8sivB/k54MXMSmPQM8FaO/xfPwPwW95abqsgmEYPKIzKJoX9Ww97IZ9kjGbrJLGt+P
 ysOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701865622; x=1702470422;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UsKZRR7fb35TZGm9xzU+NNHL9tg4Q2nzB0Mt74LhSX4=;
 b=Ec+JsSslBRXDBGGhWMV+p10fN7pfoC9Z+fy/KtX5vIOo+Ww3Fvcmw2kXqdzHE+Kmn2
 4W7nyVopACese8nCGLw4uk3kL7hx9CXsXRQ6YbB0Fc5KZqv1ucY5bGcjNn9lln7U+hhv
 KWnHzqpBLRK6++Pdnps6oTcDFP3P9D2+mb/zMFBboi24s14lUTzccdNKgb2D/K6beJdV
 CBAS22UXeBviJSeCEwx4d3DFp5Fjewa2YsyZUyfUq9/NsdQyrCPmzMBiU4KlrXW7HGX4
 QTNReImzIblIRQ9P2QnI+JT3AW+13NeTggOJ/sV0qgp0wblOBfumc/13ITwZuVZo98gr
 CkvQ==
X-Gm-Message-State: AOJu0YzuLz3ybvf0jFSEEptlDmt/pvYyO3E2hgmvzdvWvDFLC4xoBYku
 zl65GJSXzbW7ilErA1EAUpe69XOgsUWucZXYHbkoBA==
X-Google-Smtp-Source: AGHT+IGtAUsYbhUVYEL0MZxwr4M0sLnELDMNsFle3FJdHz2OEGubCuMsgvDyo+NQ/Uio0wU7tRjUGg==
X-Received: by 2002:a05:600c:4749:b0:40b:5e26:2379 with SMTP id
 w9-20020a05600c474900b0040b5e262379mr1281084wmo.42.1701862675544; 
 Wed, 06 Dec 2023 03:37:55 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bh6-20020a05600c3d0600b0040b54335d57sm17055244wmb.17.2023.12.06.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 03:37:55 -0800 (PST)
Date: Wed, 6 Dec 2023 11:37:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20231206113753.GB81045@aspen.lan>
References: <GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <GV1PR10MB6563DC208657E86715361E94E8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XpK0T-oPi2Q6-9jELFseSsvgkFtRuXP1LXK6PbV_MwCg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Dec 05, 2023 at 01:41:57PM -0800, Doug Anderson wrote:
    > Hi, > > On Sun, Nov 19, 2023 at 4:10 PM Yuran Pereira <yuran.pereira@hotmail.com>
    wrote: > > > > The function simple_strtoul performs [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.53 listed in list.dnswl.org]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
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
X-Headers-End: 1rAqzc-000386-IQ
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

T24gVHVlLCBEZWMgMDUsIDIwMjMgYXQgMDE6NDE6NTdQTSAtMDgwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIFN1biwgTm92IDE5LCAyMDIzIGF0IDQ6MTDigK9QTSBZdXJhbiBQ
ZXJlaXJhIDx5dXJhbi5wZXJlaXJhQGhvdG1haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgZnVu
Y3Rpb24gc2ltcGxlX3N0cnRvdWwgcGVyZm9ybXMgbm8gZXJyb3IgY2hlY2tpbmcgaW4gc2NlbmFy
aW9zCj4gPiB3aGVyZSB0aGUgaW5wdXQgdmFsdWUgb3ZlcmZsb3dzIHRoZSBpbnRlbmRlZCBvdXRw
dXQgdmFyaWFibGUuCj4gPiBUaGlzIHJlc3VsdHMgaW4gdGhpcyBmdW5jdGlvbiBzdWNjZXNzZnVs
bHkgcmV0dXJuaW5nLCBldmVuIHdoZW4gdGhlCj4gPiBvdXRwdXQgZG9lcyBub3QgbWF0Y2ggdGhl
IGlucHV0IHN0cmluZyAoYWthIHRoZSBmdW5jdGlvbiByZXR1cm5zCj4gPiBzdWNjZXNzZnVsbHkg
ZXZlbiB3aGVuIHRoZSByZXN1bHQgaXMgd3JvbmcpLgo+ID4KPiA+IE9yIGFzIGl0IHdhcyBtZW50
aW9uZWQgWzFdLCAiLi4uc2ltcGxlX3N0cnRvbCgpLCBzaW1wbGVfc3RydG9sbCgpLAo+ID4gc2lt
cGxlX3N0cnRvdWwoKSwgYW5kIHNpbXBsZV9zdHJ0b3VsbCgpIGZ1bmN0aW9ucyBleHBsaWNpdGx5
IGlnbm9yZQo+ID4gb3ZlcmZsb3dzLCB3aGljaCBtYXkgbGVhZCB0byB1bmV4cGVjdGVkIHJlc3Vs
dHMgaW4gY2FsbGVycy4iCj4gPiBIZW5jZSwgdGhlIHVzZSBvZiB0aG9zZSBmdW5jdGlvbnMgaXMg
ZGlzY291cmFnZWQuCj4gPgo+ID4gVGhpcyBwYXRjaCByZXBsYWNlcyBhbGwgdXNlcyBvZiB0aGUg
c2ltcGxlX3N0cnRvdWwgd2l0aCB0aGUgc2FmZXIKPiA+IGFsdGVybmF0aXZlcyBrc3RydG9pbnQg
YW5kIGtzdHJ0b2wuCj4gPgo+ID4gWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
bGF0ZXN0L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3NpbXBsZS1zdHJ0b2wtc2ltcGxlLXN0cnRv
bGwtc2ltcGxlLXN0cnRvdWwtc2ltcGxlLXN0cnRvdWxsCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
WXVyYW4gUGVyZWlyYSA8eXVyYW4ucGVyZWlyYUBob3RtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGtl
cm5lbC90cmFjZS90cmFjZV9rZGIuYyB8IDE0ICsrKysrKy0tLS0tLS0tCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jIGIva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jCj4g
PiBpbmRleCA1OTg1N2ExZWU0NGMuLjM4OTFmODg1ZTRhNiAxMDA2NDQKPiA+IC0tLSBhL2tlcm5l
bC90cmFjZS90cmFjZV9rZGIuYwo+ID4gKysrIGIva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jCj4g
PiBAQCAtOTYsMjMgKzk2LDIxIEBAIHN0YXRpYyBpbnQga2RiX2Z0ZHVtcChpbnQgYXJnYywgY29u
c3QgY2hhciAqKmFyZ3YpCj4gPiAgewo+ID4gICAgICAgICBpbnQgc2tpcF9lbnRyaWVzID0gMDsK
PiA+ICAgICAgICAgbG9uZyBjcHVfZmlsZTsKPiA+IC0gICAgICAgY2hhciAqY3A7Cj4gPiArICAg
ICAgIGludCBlcnI7Cj4gPiAgICAgICAgIGludCBjbnQ7Cj4gPiAgICAgICAgIGludCBjcHU7Cj4g
Pgo+ID4gICAgICAgICBpZiAoYXJnYyA+IDIpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIEtE
Ql9BUkdDT1VOVDsKPiA+Cj4gPiAtICAgICAgIGlmIChhcmdjKSB7Cj4gPiAtICAgICAgICAgICAg
ICAgc2tpcF9lbnRyaWVzID0gc2ltcGxlX3N0cnRvbChhcmd2WzFdLCAmY3AsIDApOwo+ID4gLSAg
ICAgICAgICAgICAgIGlmICgqY3ApCj4gPiArICAgICAgIGlmIChhcmdjKQo+ID4gKyAgICAgICAg
ICAgICAgIGlmIChrc3RydG9pbnQoYXJndlsxXSwgMCwgJnNraXBfZW50cmllcykpCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBza2lwX2VudHJpZXMgPSAwOwo+ID4gLSAgICAgICB9Cj4KPiBT
aW1pbGFyIG5pdCBhYm91dCBicmFjZXMgYXMgaW4gcGF0Y2ggIzEuIHRsO2RyIGlzIGNoYW5nZSB0
aGUgYWJvdmUgdG86Cj4KPiBpZiAoYXJnYyAmJiBrc3RydG9pbnQoYXJndlsxXSwgMCwgJnNraXBf
ZW50cmllcykpCj4gICBza2lwX2VudHJpZXMgPSAwOwoKU3VyZWx5IHRoYXQgc2hvdWxkIGJlOgoK
aWYgKC4uLikKCXJldHVybiBLREJfQkFESU5UOwoKVGhlcmUgc2VlbXMgbGl0dGxlIHBvaW50IHN3
aXRjaGluZyB0byBhICJzYWZlciIgQVBJIGlmIHdlIGp1c3QgaWdub3JlIHRoZQplcnJvcnMgaXQg
cHJvdmlkZXMgdXMuCgoKRGFuaWVsLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9y
dEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
