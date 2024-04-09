Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96A89CF92
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Apr 2024 02:54:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rtzkj-0002ca-PW
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Apr 2024 00:54:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <justinstitt@google.com>) id 1rtzkg-0002cR-IK
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Apr 2024 00:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IAaOrnh08gDDN4c+q0l1+Xwj6sb8iH6us+XtwUqPkIo=; b=YI6JMlT27bG/VW5r+9jVzqFxFR
 CRFfea9xY1XJG8cNza0a3l4zFqxkmpRSFf/IeKOzx5M6/II7HpttP+LAv2pFhGoyxsxLvY3aEj66B
 i502ZI+adYkgG0i2R6qPtefqnzaB6ipj6i82Yrx1YST9Y3QCwH/mB/GlHdMHk0kWeJ24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IAaOrnh08gDDN4c+q0l1+Xwj6sb8iH6us+XtwUqPkIo=; b=Ix3GjoREnlbSf9Cxbr3ylFI/5E
 1VZJxPIZxIL167bADQrJW1KAiM7XSJ6O6xbwKIY/KSYm2NNKnJvkeIhW6v1H7WpTGn9eqoCMbPtIg
 rmvusEK93y3rkcWUfgDyP7ALussWHp2kmY0eCMmFzrOMJMsFtMpERirwmxnQ7bw5Mzbc=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rtzkb-0001pg-4L for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Apr 2024 00:54:17 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3454fbdd88aso2331546f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Apr 2024 17:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712624041; x=1713228841;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAaOrnh08gDDN4c+q0l1+Xwj6sb8iH6us+XtwUqPkIo=;
 b=naIf51vV6A1qJRQx/BuIR40AE7CClYKU9EGOHXYItqez+6vPB0oPexVfdlYco3gq+q
 47PcBHot3lW2Go91vk5Rz7XjcaLLuWtft05EtwRSkx+Ra4xqNucBVSKZ5qGQ1eP/QgeY
 tT+fSOquPClBy+lfRlRY6lyBHBWxPMNUACkIZKjZyKZ4TSlgPVGfBEaShqs7O+dhVK3l
 zpvMn3TKCYzA2cH7ZoWKjpa/m+ItGvmNdgl8N9ceIr6JOj28gmBqk1s7g/BdV4Xh7/s6
 D1phGB9CjAzqbizMISxKgujiZmlQA16wJWu/JQiyJNWuRaRA6JAO9dSqGGCxEGgkAIsm
 Wseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712624041; x=1713228841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAaOrnh08gDDN4c+q0l1+Xwj6sb8iH6us+XtwUqPkIo=;
 b=Gpka19kJ+9EyUMgG6cLHHVR2CHQA+7g/c0w7l/J99KznxXv7JEyXn9SajDYWWXCtm3
 OQ+++DWBCkgLCzR0fLbY0PiFGnzgGJkoCx3Ism56akXIpaJByRLxN7JqX9M0X56uqQbx
 2r46P0EUyqmKlIpqd+us5XHKYg0dVE61M7oeEOttZzVdVb8P+DMQVfV5jFKDxMx52X4x
 wjUpJSV57PhH+711G1aTLOBPT4YGApFYUa2QORBIhgGjQZMpgtyZ+vTgYXoA8qPIG8KB
 QCUgbPPk1YYaX18W5lzSBzEjVYuRN95H/LWjACdsgBfi1/5I7bPjHXGnFVhtnKNDdB40
 Cbpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUUnL2LGNtTd/gR24bUFipYCow7d4pDhXYDJIxkILTo7+JZazdhAjDJnZlX5r9sSoVUBU8UfCKTt4uu/KboBxXXg2YZ3hLk7SkiANF20tNNmzx9pM=
X-Gm-Message-State: AOJu0YxSAjm/PzewHBW55ZL0n1fwtFQvrh2DKNktNV9zP2hFoEorsBTY
 KSdBh9VtcsKoTiRALroyP+VCZ+6P+SQQeukrm9huAVnpbkzbnASWKBL2p3b/a1LsABSk+qoi0ou
 mfVAsjCoZh9MJhnaxFa7A9qPaxKnkRhEbU0xlpZcJ7yIqFNysoK26
X-Google-Smtp-Source: AGHT+IGc0lj+fiC2sXIjuliZLsfp/BjTYjGSVXvVjzrsIb1sivcbJfZxakLmiUfgp5f/pckL+Y6vnZ7DHo+6jCgBIfk=
X-Received: by 2002:a50:d796:0:b0:56e:2ebc:5c4 with SMTP id
 w22-20020a50d796000000b0056e2ebc05c4mr7572527edi.20.1712623614748; Mon, 08
 Apr 2024 17:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
 <20240405095144.GB2890893@aspen.lan>
In-Reply-To: <20240405095144.GB2890893@aspen.lan>
Date: Mon, 8 Apr 2024 17:46:42 -0700
Message-ID: <CAFhGd8q99emm1SFJSs=L7Pn0A79vCtDHtTD5XUbVCNh=DDadaQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Apr 5, 2024 at 2:51 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > > len_tmp = strlen(p_tmp); > > - strncpy(cp, p_tmp+len, len_tmp-len
    + 1); > > + strscpy(cp, p_tmp+len, len_tmp- [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.47 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rtzkb-0001pg-4L
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: replace deprecated strncpy
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gRnJpLCBBcHIgNSwgMjAyNCBhdCAyOjUx4oCvQU0gRGFuaWVsIFRob21wc29uCjxkYW5pZWwu
dGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICBs
ZW5fdG1wID0gc3RybGVuKHBfdG1wKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBzdHJuY3B5
KGNwLCBwX3RtcCtsZW4sIGxlbl90bXAtbGVuICsgMSk7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgc3Ryc2NweShjcCwgcF90bXArbGVuLCBsZW5fdG1wLWxlbiArIDEpOwo+Cj4gQWdhaW4sIEkg
cmVhbGx5IGRvbid0IHRoaW5rIHRoZSB0aGlyZCBhcmd1bWVudCBwcm92aWRlcyB0aGUgbnVtYmVy
IG9mCj4gY2hhcmFjdGVycyBpbiB0aGUgZGVzdGluYXRpb24gYnVmZmVyLgo+CgpSaWdodCwgdGhl
IHRoaXJkIGFyZ3VtZW50IGlzIHRoZSBsZW5ndGggb2YgdGhlICJyZW1haW5pbmciIGNoYXJhY3Rl
cnMKZnJvbSB0aGUgY29tcGxldGlvbiBwb2ludC4KCmlmIHlvdSB0eXBlICJ0ZXMiIGFuZCBwcmVz
cyB0YWIgdGhlbiBrYWxsc3ltc19zeW1ib2xfY29tcGxldGUoKSB3aWxsCnBvcHVsYXRlIHBfdG1w
IHdpdGggInRlc3QiLiBQcmlvciB0byByZW5kZXJpbmcgdG8gdGhlIHVzZXIsIEBjcCBwb2ludHMK
dG8gInMiLCB3ZSBuZWVkIHRvIGNhdGNoIHRoZSB1c2VyIHVwIGFuZCBwcmludCB0aGUgcmVzdCBv
ZiB0aGUgc3ltYm9sCm5hbWUgc2luY2UgdGhleSd2ZSBhbHJlYWR5IHR5cGVkICJ0ZXMiIHdlIG9u
bHkgbmVlZCB0byBwcmludCBvdXQgInQiLgoKbGVuX3RtcCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBl
bnRpcmUgc3ltYm9sIHBhcnQgYXMgcmV0dXJuZWQgYnkKa2FsbHN5bXNfc3ltYm9sX2NvbXBsZXRl
KCkgYW5kIGxlbiBpcyB0aGUgbGVuZ3RoIG9mIG9ubHkgdGhlCnVzZXItdHlwZWQgc3ltYm9sLiBU
aGVyZWZvcmUsIHRoZSBhbW91bnQgb2YgcmVtYWluaW5nIGNoYXJhY3RlcnMgdG8KcHJpbnQgaXMg
Z2l2ZW4gYnkgbGVuX3RtcC1sZW4gKGFuZCArMSBmb3IgYSBOVUwtYnl0ZSkuCgpTbywgeWVhaCwg
eW91J3JlIHJpZ2h0LiBUaGlzIGlzbid0IHRoZSBsZW5ndGggb2YgdGhlIGRlc3RpbmF0aW9uIGJ1
dCBJCmRvbid0IHNlZSB3aHkgd2UgY2FuJ3QgdXNlIG1lbWNweSgpIChvciBzdHJzY3B5KCkpIGFu
ZCBoYXZlIHRoaXMgbm90CmJlIGNvbnNpZGVyZWQgImJyb2tlbiIuIFRoZSBwb2ludGVyIGFyaXRo
bWV0aWMgY2hlY2tzIG91dC4KCkkgdGVzdGVkIG91dCBzdHJjYXQgYW5kIG90aGVyIGFsdGVybmF0
aXZlcyBhbmQgdGhleSBhbGwgc2VlbSBsZXNzIHJlYWRhYmxlLgoKPgo+IERhbmllbC4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9y
dCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
