Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0133727319
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:37:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72iF-0001cE-MQ
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:37:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72iE-0001c7-EC
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HG+ft0QEOw+l4T57sY6QqoB2Q4VLY5mgSyLH0/dKkXM=; b=YKm6jQGUVBvZvBLKb9sfrPAebb
 AeN4c6PRLBX+Lr5rGyTTPRpa1U6sII1+TJUegDI1XFSuHQ/BQO+1oAzg6qUMjK4maIjI9TyyoOyUT
 abn/jPsCpickrPtFmFYJVlMnEfeYJ5BpPQP37EaBeGXhy5c9Wb0xUzL65WlI3wxrGa7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HG+ft0QEOw+l4T57sY6QqoB2Q4VLY5mgSyLH0/dKkXM=; b=eXXlfhLSvnJQV+axT4iraF5J+4
 2rgv8DD8vOjvYC9Iw7TXUFxdXuSKaTGEPgmOxoiKqVPGNJ2yIxDpuNOoPF2EFcqmZf2Rz0u5Y2eC6
 dY0VjQNTT2WdVFfPB7Sx2t992AuYWVlyzxljL+JpYqTIjyeR+ybCUdfOzg+V3zWzk1po=;
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72iB-0001z0-Fy for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:11 +0000
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-777a4c8e8f4so267727139f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686181021; x=1688773021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HG+ft0QEOw+l4T57sY6QqoB2Q4VLY5mgSyLH0/dKkXM=;
 b=oaXcUKk5abltt6CAWt7RJKDE5+S8Q4mmUuvuRLrU3jPFHt79X8tNA3wXI83YBky7rD
 rrFto6RsX2P8luXadcahrNXiZvtT9UkWbkZ/Xmo2V6dPNJSfN4+WeHREpK9oJtUeIPYr
 4dZT39+OmMK/aEAbjtcZHjy9KssyfdIX9Ia3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686181021; x=1688773021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HG+ft0QEOw+l4T57sY6QqoB2Q4VLY5mgSyLH0/dKkXM=;
 b=BwuLu3HZ47BVu3cnimu99bXMemaR1IHzwtG4XTJjp5mbHoCSG3Dz3xMyJHIcrnekfR
 ckj2olweFhzUs/WQ4jHt01u+dir63CM2+pFISIlX5x2bMC58r68fHAfzDcM0nkf263Rb
 gtQK+3UqMAndaY1Ndvy5Uaer0Hv8tM2+r07k1t4tO/CuZY1/BWMLuiDMhmZXXHqB9U/2
 PJuy3kPJXvFpXf2CLO4R3gpbuvGgD3xTRJfRN90Huqe84NKirM4Tvfg/XgLf3ARosOv9
 SorzQDhXTAEbZJya5WpkJz+Vl2jR9iuHyjyeq+ufCvKUVrFTho8R/UVDW6x2tSSIYKTp
 g4Iw==
X-Gm-Message-State: AC+VfDyKGAuz98PDMwjF/GnmwzP3KuCKR16etllS4Cnh5uGd7PBIiuv8
 juQ+6s3SvUsJePLKaC5AoflG05pF/4yx3U7i66o=
X-Google-Smtp-Source: ACHHUZ74ba5Ru3IPVLCTH+4eFqBvtfwniyDatu7fmVoI+sizHz3vTXLyZVsfDueAwlkeX73KmlOMiw==
X-Received: by 2002:a6b:fc06:0:b0:777:ac19:f883 with SMTP id
 r6-20020a6bfc06000000b00777ac19f883mr10119769ioh.3.1686181021135; 
 Wed, 07 Jun 2023 16:37:01 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 dq31-20020a0566384d1f00b0041f5061884asm2638762jab.29.2023.06.07.16.36.55
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:36:55 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so56595ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:36:55 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c4c:b0:33d:8238:80c6 with SMTP id
 d12-20020a056e021c4c00b0033d823880c6mr101962ilg.9.1686181015033; Wed, 07 Jun
 2023 16:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-6-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-6-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:36:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTKR42i8hozXSfSHu07TQ7g1TJQs8dqpqGHHraZr+-vQ@mail.gmail.com>
Message-ID: <CAD=FV=VTKR42i8hozXSfSHu07TQ7g1TJQs8dqpqGHHraZr+-vQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com>
    wrote: > > The configuration variable HAVE_NMI_WATCHDOG has a generic name
    but > it is selected only for SPARC64. > > It should _not_ be [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72iB-0001z0-Fy
Subject: Re: [Kgdb-bugreport] [PATCH 5/7] watchdog/sparc64: Rename
 HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64
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
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDg6MjXigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29uZmlndXJhdGlvbiB2YXJpYWJsZSBIQVZFX05N
SV9XQVRDSERPRyBoYXMgYSBnZW5lcmljIG5hbWUgYnV0Cj4gaXQgaXMgc2VsZWN0ZWQgb25seSBm
b3IgU1BBUkM2NC4KPgo+IEl0IHNob3VsZCBfbm90XyBiZSB1c2VkIGluIGdlbmVyYWwgYmVjYXVz
ZSBpdCBpcyBub3QgaW50ZWdyYXRlZCB3aXRoCj4gdGhlIG90aGVyIGhhcmRsb2NrdXAgZGV0ZWN0
b3JzLiBOYW1lbHksIGl0IGRvZXMgbm90IHN1cHBvcnQgdGhlIGhhcmRsb2NrdXAKPiBzcGVjaWZp
YyBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyBhbmQgc3lzdGNsIGludGVyZmFjZS4gSW5zdGVhZCwg
aXQgaXMKPiBlbmFibGVkL2Rpc2FibGVkIHRvZ2V0aGVyIHdpdGggdGhlIHNvZnRsb2NrdXAgZGV0
ZWN0b3IgYnkgdGhlIGdsb2JhbAo+ICJ3YXRjaGRvZyIgc3lzY3RsLgo+Cj4gUmVuYW1lIGl0IHRv
IEhBVkVfSEFSRExPQ0tVUF9XQVRDSERPR19TUEFSQzY0IHRvIG1ha2UgdGhlIHNwZWNpYWwKPiBi
ZWhhdmlvciBtb3JlIGNsZWFyLgo+Cj4gQWxzbyB0aGUgdmFyaWFibGUgaXMgc2V0IG9ubHkgb24g
c3BhcmM2NC4gTW92ZSB0aGUgZGVmaW5pdGlvbgo+IGZyb20gYXJjaC9LY29uZmlnIHRvIGFyY2gv
c3BhcmMvS2NvbmZpZy5kZWJ1Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHIgTWxhZGVrIDxwbWxh
ZGVrQHN1c2UuY29tPgo+IC0tLQo+ICBhcmNoL0tjb25maWcgICAgICAgICAgICAgfCAxMiAtLS0t
LS0tLS0tLS0KPiAgYXJjaC9zcGFyYy9LY29uZmlnICAgICAgIHwgIDIgKy0KPiAgYXJjaC9zcGFy
Yy9LY29uZmlnLmRlYnVnIHwgMTIgKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbm1pLmgg
ICAgICB8ICA0ICsrLS0KPiAga2VybmVsL3dhdGNoZG9nLmMgICAgICAgIHwgIDIgKy0KPiAgbGli
L0tjb25maWcuZGVidWcgICAgICAgIHwgIDUgKy0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVn
cmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
