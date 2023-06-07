Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55772731B
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:37:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72iS-0007BF-Hq
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:37:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72iR-0007B9-3C
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D+jSOn4aArekcx3+zLzXPOVm14+fmJKsE3biZ6If6cY=; b=NL75ivUvGfWjp1yH6lgsjFsda4
 zbk7kd3wpVMlqQ5eGNxBjJXAGWlCRyNBe55gdDv8A6Wi669WQV2t42yUMB8pM4gieMDfoOOfsGHcX
 ZzK8S9eVFrocrgNzjBYKixvFoQIJZSMuSnLniTAYZmT6OOtmtszw+sQALtbuZNabbfnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D+jSOn4aArekcx3+zLzXPOVm14+fmJKsE3biZ6If6cY=; b=JwfdkDsY/SwXVAiD5G4sOG0Yv/
 5Gb0GA77VJ27EcQWuwhtNvvss0AAazz14c2q2zIMQgP8s47fFdJ2rnNtKZhnLvzvVy28DqcTNgw6R
 CV9/XzkcnFv7Y51dv56SjJqaN+K4BRJ9WUiMD1Q35z7MxxuFNpKGay7qEcNsEVvx58D0=;
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72iN-00E9wB-0X for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:23 +0000
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-77a1cad6532so132317939f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686181032; x=1688773032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+jSOn4aArekcx3+zLzXPOVm14+fmJKsE3biZ6If6cY=;
 b=mSq92/qLZx/j6gkTFVZ/VQuNSuWhSyPpr20veQ2GQ6vPzHEEUNzORqAn2ASlRqoXKe
 EyH6IgCfrTX2vYfyW5PjqWYYJ/lsCRlfNZAdD8mLobduiTkdKn1+tLQ/9jH8EFcg7DBd
 XjhSuJLAuEtiJx1/CZtfzFjTtyYbd9xC3RlJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686181032; x=1688773032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+jSOn4aArekcx3+zLzXPOVm14+fmJKsE3biZ6If6cY=;
 b=lNxUfIfs52IKf3cW3rduNlKzX5/cms/VK2Wv+Ok9p+ZD1hN8xiQgq/Gymm0Tk61UKc
 y5BDpsFL6cc0m3C9KDWViCJi7JF4hfdwqumfTZcFvWvYzK/5Og8ampnDTLXwH4XyCfgY
 FkSI4L0ghe4mo4GK8Q2oY9bhnNbTi6f3VlpFm3uYmHvqkcx6RlR8ASYnwHYqz5cLWFdn
 sSgyyRXCm5TeOG+aHYXbLaw+uTiHXxHx7tqv/AIeBTwIzi3MBMAGlOrB4rqysjqmpEX9
 A4rKtxPK5OWlEai3bafzDRWFKPfTy/QERBp6wL2jKD6oi/CbJSH2lF2h72mGaA18FQPI
 1laQ==
X-Gm-Message-State: AC+VfDxq6PNlrmMO27WKUcjmQyAkS2Sp26wxWzlfbu0vCVxa61X621EG
 68Q9dN2bLG9LRupG6BVrbDWSOPoBwEGW4SorRz4=
X-Google-Smtp-Source: ACHHUZ5l+yeUJQNdVi8cN7gNoKdhSLXpp6r/6zPLhVMx6dw5BD8fcTf+sZe8X3fsL5cWlTzlbWMGZA==
X-Received: by 2002:a5e:de08:0:b0:76c:c701:2f77 with SMTP id
 e8-20020a5ede08000000b0076cc7012f77mr10532949iok.3.1686181032075; 
 Wed, 07 Jun 2023 16:37:12 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 s13-20020a02cc8d000000b0041eb1fb695csm3171472jap.105.2023.06.07.16.37.02
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:37:05 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so56635ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:02 -0700 (PDT)
X-Received: by 2002:a05:6e02:170c:b0:33c:a46c:23b3 with SMTP id
 u12-20020a056e02170c00b0033ca46c23b3mr99141ill.1.1686181022226; Wed, 07 Jun
 2023 16:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-7-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-7-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:36:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-H9z20zT8Oop5+Hnf-S3QgiotzQ=f3LGvN6AiLUxi=Q@mail.gmail.com>
Message-ID: <CAD=FV=V-H9z20zT8Oop5+Hnf-S3QgiotzQ=f3LGvN6AiLUxi=Q@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:26 AM Petr Mladek <pmladek@suse.com>
    wrote: > > The HAVE_ prefix means that the code could be enabled. Add another
    > variable for HAVE_HARDLOCKUP_DETECTOR_SPARC64 without th [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.51 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72iN-00E9wB-0X
Subject: Re: [Kgdb-bugreport] [PATCH 6/7] watchdog/sparc64: Define
 HARDLOCKUP_DETECTOR_SPARC64
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

SGksCgpPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDg6MjbigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgSEFWRV8gcHJlZml4IG1lYW5zIHRoYXQgdGhlIGNv
ZGUgY291bGQgYmUgZW5hYmxlZC4gQWRkIGFub3RoZXIKPiB2YXJpYWJsZSBmb3IgSEFWRV9IQVJE
TE9DS1VQX0RFVEVDVE9SX1NQQVJDNjQgd2l0aG91dCB0aGlzIHByZWZpeC4KPiBJdCB3aWxsIGJl
IHNldCB3aGVuIGl0IHNob3VsZCBiZSBidWlsdC4gSXQgd2lsbCBtYWtlIGl0IGNvbXBhdGlibGUK
PiB3aXRoIHRoZSBvdGhlciBoYXJkbG9ja3VwIGRldGVjdG9ycy4KPgo+IEJlZm9yZSwgaXQgaXMg
ZmFyIGZyb20gb2J2aW91cyB0aGF0IHRoZSBTUEFSQzY0IHZhcmlhbnQgaXMgYWN0dWFsbHkgdXNl
ZDoKPgo+ICQ+IG1ha2UgQVJDSD1zcGFyYzY0IGRlZmNvbmZpZwo+ICQ+IGdyZXAgSEFSRExPQ0tV
UF9ERVRFQ1RPUiAuY29uZmlnCj4gQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVURE
WT15Cj4gQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9TUEFSQzY0PXkKPgo+IEFmdGVy
LCBpdCBpcyBtb3JlIGNsZWFyOgo+Cj4gJD4gbWFrZSBBUkNIPXNwYXJjNjQgZGVmY29uZmlnCj4g
JD4gZ3JlcCBIQVJETE9DS1VQX0RFVEVDVE9SIC5jb25maWcKPiBDT05GSUdfSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX0JVRERZPXkKPiBDT05GSUdfSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1NQ
QVJDNjQ9eQo+IENPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX1NQQVJDNjQ9eQo+Cj4gU2lnbmVk
LW9mZi1ieTogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+Cj4gLS0tCj4gIGFyY2gvc3Bh
cmMvS2NvbmZpZy5kZWJ1ZyB8IDEwICsrKysrKysrKy0KPiAgaW5jbHVkZS9saW51eC9ubWkuaCAg
ICAgIHwgIDQgKystLQo+ICBrZXJuZWwvd2F0Y2hkb2cuYyAgICAgICAgfCAgMiArLQo+ICBsaWIv
S2NvbmZpZy5kZWJ1ZyAgICAgICAgfCAgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9y
dEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
