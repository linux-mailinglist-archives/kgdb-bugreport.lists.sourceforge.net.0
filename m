Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95A911532
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Jun 2024 23:58:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKPn4-0004xA-IY
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 20 Jun 2024 21:57:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sKPn3-0004x1-0a
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Jun 2024 21:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cgpZuvTOSCQwSwrSDKbcgcYsYQm5vLnKo77zS7I58gQ=; b=M80hK3o/fV8hIJYxq/O4NwLlp0
 RQXbYN4JhLARhVOJ7NhbYT7diO+b/pZmz3yPLPOQvE+Cb8wlOIEBZOjNpQrtiFOuWbruYuheU2uqH
 CzF+t+IGRfg7Il+rShi8pTHFnZXeJS8DOunx+8+FotCBrJ18/ULhZI4wyTWSqpEOLpRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cgpZuvTOSCQwSwrSDKbcgcYsYQm5vLnKo77zS7I58gQ=; b=PiK1B0KSITX0z9se3jrjgDxemA
 OG/pIJy+55D1Ri6n1VReM9ZIOAs0g+llbYHKuBXdtPl9igmNwudG+Mz1U28rk+pP5umqJdzYdwh2e
 TXZaIzK8qFQYDFVzrYPzVIu4GogVgo9fEbv4nO6gTvMoXEzQD0InTyMcn00gKV/eDP7U=;
Received: from mail-qv1-f42.google.com ([209.85.219.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKPn4-00074H-AE for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Jun 2024 21:57:58 +0000
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b05c9db85fso6216816d6.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 20 Jun 2024 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718920665; x=1719525465;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgpZuvTOSCQwSwrSDKbcgcYsYQm5vLnKo77zS7I58gQ=;
 b=VCs5vLskWtw4WmOsjxaIrQX5HN2e6bWX2FjCvGPYhWHNS9ph14SptfU3005OTm8Qsh
 QmSOhrNz6t/MN4C2BGszqO54Yxv0r37K55Wl/4FDMy/sZjDqlrmKmopS29S+uUsNtsMZ
 9c4PWOAhJ0uGmIi76He0OMhcz5gTtkJtnavbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718920665; x=1719525465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgpZuvTOSCQwSwrSDKbcgcYsYQm5vLnKo77zS7I58gQ=;
 b=Uur50IkJfSditnTai5pTqiV6b20uMTuSxLCfC/vAq4JwX3duUK2v2iq7ncWI4V00s7
 bWNli2z1KppjEgeBFrPIKM6v0GEtfXJHXnjcIuRP4L3b6n+iWZhZU3yhxdaAN5DD0tOc
 fu1FEDZIe6U056P7cP1/cOfxF1E1l1hkGa1QJ8pfRClnAIWn+BW5JFGAW/OHFx0hbXnq
 JLD97mtLZ/H40kXL7095kv0VcVscEggAGxXbzzpS7OJ4Vev9amsgdbP2a5nmKwCvoKAF
 8WtF9ttRQJ6No78xY2MdxEGLsoBmsi1QCpNfEJ2FkuMfClBlsODOnJXZ/Wil9cykduJy
 vbOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQYlzEMWrbh3VnMhnL6SnznHumH9wBNhcygvEsb521+IrC73c2AlS/ih92S3Tvw1JCWRvTdVif+n3u0yGvNy8kniJZr+W1jUl5Eo/BWd4mwiXgzN8=
X-Gm-Message-State: AOJu0YyHhO9MX8bN0U2pfoyQQI0OhbZAYPZHCUOfJsHdA5nt3FXPUI9h
 gFBtrFrJGgDjZ3RH8u8yJdwFD5PgFnBibbPjrnIdsrEV6BBSxPCPNY4Fna2u1+rXwLfQHqdLsnU
 =
X-Google-Smtp-Source: AGHT+IHj8WsUSdU1FDXPo6Sl9gp4nLGsJD2iikcEbF6ewnOKyQyA2Y17ZxB/Nl+oyTXchhY8CXMe3Q==
X-Received: by 2002:a05:6214:cf:b0:6b4:fc6f:17ba with SMTP id
 6a1803df08f44-6b501e405b2mr62087966d6.33.1718920665024; 
 Thu, 20 Jun 2024 14:57:45 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef5fbd6sm577406d6.124.2024.06.20.14.57.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 14:57:43 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-443580f290dso42641cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 20 Jun 2024 14:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAs525Oe/x0CG7lMWggtnjrqPz+aBB7IA6mSIrw8svAe0i01K2nG1CmfDKmMquv4viZ6I535aX744AF8SkE72nMH2cskV/otE6Qwe8MfF8+1ksKJg=
X-Received: by 2002:a05:622a:207:b0:444:a760:55de with SMTP id
 d75a77b69052e-444c1b498demr1027261cf.24.1718920663231; Thu, 20 Jun 2024
 14:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240619125803.148130-1-zhengzengkai@huawei.com>
In-Reply-To: <20240619125803.148130-1-zhengzengkai@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Jun 2024 14:57:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xi+dWZtt1oJYMgz-AKMX4EF7euASCQh0ygLhxCaaNDuw@mail.gmail.com>
Message-ID: <CAD=FV=Xi+dWZtt1oJYMgz-AKMX4EF7euASCQh0ygLhxCaaNDuw@mail.gmail.com>
To: Zheng Zengkai <zhengzengkai@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 19, 2024 at 5:34 AM Zheng Zengkai <zhengzengkai@huawei.com>
    wrote: > > Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
    > removed the only definition of macro _TIF_MCA_I [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.42 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.42 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.42 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKPn4-00074H-AE
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Get rid of redundant
 kdb_curr_task()
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
Cc: pmladek@suse.com, daniel.thompson@linaro.org,
 kgdb-bugreport@lists.sourceforge.net, thorsten.blum@toblux.com,
 christophe.jaillet@wanadoo.fr, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCA1OjM04oCvQU0gWmhlbmcgWmVuZ2thaSA8emhl
bmd6ZW5na2FpQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gQ29tbWl0IGNmOGU4NjU4MTAwZCAoImFy
Y2g6IFJlbW92ZSBJdGFuaXVtIChJQS02NCkgYXJjaGl0ZWN0dXJlIikKPiByZW1vdmVkIHRoZSBv
bmx5IGRlZmluaXRpb24gb2YgbWFjcm8gX1RJRl9NQ0FfSU5JVCwgc28ga2RiX2N1cnJfdGFzaygp
Cj4gaXMgYWN0dWFsbHkgdGhlIHNhbWUgYXMgY3Vycl90YXNrKCkgbm93IGFuZCBiZWNvbWVzIHJl
ZHVuZGFudC4KPgo+IExldCdzIHJlbW92ZSB0aGUgZGVmaW5pdGlvbiBvZiBrZGJfY3Vycl90YXNr
KCkgYW5kIHJlcGxhY2UgcmVtYWluaW5nCj4gY2FsbHMgd2l0aCBjdXJyX3Rhc2soKS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFpoZW5nIFplbmdrYWkgPHpoZW5nemVuZ2thaUBodWF3ZWkuY29tPgo+IC0t
LQo+ICBrZXJuZWwvZGVidWcva2RiL2tkYl9idC5jICAgICAgfCAgMiArLQo+ICBrZXJuZWwvZGVi
dWcva2RiL2tkYl9tYWluLmMgICAgfCAxOCArKysrLS0tLS0tLS0tLS0tLS0KPiAga2VybmVsL2Rl
YnVnL2tkYi9rZGJfcHJpdmF0ZS5oIHwgIDIgLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKTG9va3MgcmlnaHQgdG8gbWUuCgpSZXZpZXdlZC1i
eTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKSXQncyBzbGlnaHRs
eSBhbm5veWluZyB0aGF0IHRoaXMgaXNuJ3QgQ0NlZCBhbnkga2VybmVsIG1haWxpbmcgbGlzdHMK
dGhhdCBhcmUgdHJhY2tlZCBieSBsb3JlLmtlcm5lbC5vcmcsIGJ1dCBJIGd1ZXNzIHRoYXQnbGwg
YmUgdXAgdG8KRGFuaWVsIHRvIGZpZ3VyZSBvdXQuIDotUAoKLURvdWcKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5n
IGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
