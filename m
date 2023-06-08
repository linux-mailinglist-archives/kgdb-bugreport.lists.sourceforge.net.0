Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D335C7281DF
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 15:55:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q7G7C-0001dR-Ac
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 13:55:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q7G7B-0001dL-Ee
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 13:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=27Vs9lje4ue6a9YND5XSnEpnS9VI2Lo/geXINpFnbB8=; b=HvzkmmlicZiQytVxMZt3k0bAgd
 i1F7NQcyiQ+WbG3PNTFYd1UmidlkVtikWt9opF/8iDB7TPwtqVCmgIfe6VzrmSFP7Pm7OM19ILI3X
 4v/V01+U9T38uplOxJ65OyfjYAa72HL1VRl9wHuBa6RRsx615jd0yjvehWJgcA8KbcEw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=27Vs9lje4ue6a9YND5XSnEpnS9VI2Lo/geXINpFnbB8=; b=fQKqTIbj0t9gn3F889zM7KpRcB
 +8Vb+k+QOoS8X4V6KVvaRu6a7FennchNOO+2rXcuq1C8UJisd5LR4xBRZQqRKGmmamVhcDGwXM8qr
 yZxgBV5RUzr+utkFLMfEnLODjpqI3KutPI0Nl5VP0IDjI7TfoFFmX7NuqCn3JeE8qLT0=;
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7G76-0005q3-ID for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 13:55:48 +0000
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-33c1e7743b7so1947905ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 08 Jun 2023 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686232537; x=1688824537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27Vs9lje4ue6a9YND5XSnEpnS9VI2Lo/geXINpFnbB8=;
 b=oVg83mrTBUl29PTk+RqO5MA1BbM29G9oM3VedLfG6Qy1nJ9HCw3ztfODFjNfW/5Foj
 PV9ypqz1v+8NtZyWCWnd+W4r6KFZUVomawer+u+FDGofP56S8HQjCx39B7+Wj2Mltud4
 3FUSID/L+JQ3Q0AHzm5LxcJ0wqiK8FdELAXCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686232537; x=1688824537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27Vs9lje4ue6a9YND5XSnEpnS9VI2Lo/geXINpFnbB8=;
 b=cRPz4D/hMvKOKGMJqm/W5e+oEWU6qaL2IFZqiQeuX499XYC1QXN1vvYHZta5eCtPOl
 6yAZCkTveHVVWuykgOeL+NGDIbC0LjaRI9TTXarFd8UzqEPGIOafCUA7a7dPoiFm9+bw
 DUAd3mliP4oTLu5+z76zFSkMtNTm06LP9qSVqoYd++9UR2WFtBkEr0XSZAxsElLebKfF
 brPsoXORxWkUsnvMQnj0rVdHxZKtUa1bHS5KtVdXliBwkG0E0BtTlvx/DRJcYXtdhJ8i
 v/vsrNw8QX6APB0foIeyRj2fRJK/H09yC7qz/kASSJ0zYBL/2h/4MQadUJXbSWLsK8aT
 IIGQ==
X-Gm-Message-State: AC+VfDywgAnOUg35c3giajYLem7HMPf+0o0YxaGQWglUSI2VS8bLJI0d
 nvD6T2RZBeLe4hUsvFoAH960Rr+nk9Rfspi7ytQ=
X-Google-Smtp-Source: ACHHUZ7+vv6H6oVZFesFdEr1j4VkwLZIOt+O19q17iJ8iWQ4+0u586XKeFUTStahp+GqdNojCXTh/w==
X-Received: by 2002:a05:6e02:4d1:b0:328:6412:df0e with SMTP id
 f17-20020a056e0204d100b003286412df0emr10898301ils.29.1686232537149; 
 Thu, 08 Jun 2023 06:55:37 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 h9-20020a92d849000000b0032afe23820bsm430774ilq.17.2023.06.08.06.55.35
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 06:55:35 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33d928a268eso121325ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 08 Jun 2023 06:55:35 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a82:b0:32f:7715:4482 with SMTP id
 k2-20020a056e021a8200b0032f77154482mr109894ilv.4.1686232535228; Thu, 08 Jun
 2023 06:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
 <ZIG1Qi0iUjTKICQM@alley>
In-Reply-To: <ZIG1Qi0iUjTKICQM@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 06:55:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
Message-ID: <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Jun 8, 2023 at 4:02 AM Petr Mladek <pmladek@suse.com>
    wrote: > > > > config HARDLOCKUP_DETECTOR > > > bool "Detect Hard Lockups"
    > > > depends on DEBUG_KERNEL && !S390 > > > - depends on HAV [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.177 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.177 listed in list.dnswl.org]
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
X-Headers-End: 1q7G76-0005q3-ID
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] watchdog/hardlockup: Make the
 config checks more straightforward
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

SGksCgpPbiBUaHUsIEp1biA4LCAyMDIzIGF0IDQ6MDLigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiA+ID4gIGNvbmZpZyBIQVJETE9DS1VQX0RFVEVDVE9SCj4g
PiA+ICAgICAgICAgYm9vbCAiRGV0ZWN0IEhhcmQgTG9ja3VwcyIKPiA+ID4gICAgICAgICBkZXBl
bmRzIG9uIERFQlVHX0tFUk5FTCAmJiAhUzM5MAo+ID4gPiAtICAgICAgIGRlcGVuZHMgb24gSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX05PTl9BUkNIIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9BUkNICj4gPiA+ICsgICAgICAgZGVwZW5kcyBvbiAoKEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9QRVJGIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSkgJiYgIUhBVkVfTk1JX1dB
VENIRE9HKSB8fCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSAo+ID4KPiA+IEFkZGluZyB0
aGUgZGVwZW5kZW5jeSB0byBidWRkeSAoc2VlIGFibG92ZSkgd291bGQgc2ltcGxpZnkgdGhlIGFi
b3ZlCj4gPiB0byBqdXN0IHRoaXM6Cj4gPgo+ID4gZGVwZW5kcyBvbiBIQVZFX0hBUkRMT0NLVVBf
REVURUNUT1JfUEVSRiB8fAo+ID4gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZIHx8IEhB
VkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNICj4KPiBUaGlzIGlzIGV4YWN0bHkgd2hhdCBJIGRv
IG5vdCB3YW50LiBJdCB3b3VsZCBqdXN0IG1vdmUgdGhlIGNoZWNrCj4gc29tZXdoZXJlIGVsc2Uu
IEJ1dCBpdCB3b3VsZCBtYWtlIHRoZSBsb2dpYyBoYXJkZXIgdG8gdW5kZXJzdGFuZC4KCkhtbW0u
IFRvIG1lLCBpdCBmZWx0IGVhc2llciB0byB1bmRlcnN0YW5kIGJ5IG1vdmluZyB0aGlzIGludG8g
dGhlCiJIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQlVERFkiLiBUbyBtZSBpdCB3YXMgcHJldHR5
IGVhc3kgdG8gc2F5ICJpZgphbiBhcmNoaXRlY3R1cmUgZGVmaW5lZCBpdHMgb3duIGFyY2gtc3Bl
Y2lmaWMgd2F0Y2hkb2cgdGhlbiBidWRkeQpjYW4ndCBiZSBlbmFibGVkIiBhbmQgdGhhdCBmZWx0
IGxpa2UgaXQgZml0IGNsZWFubHkgd2l0aGluIHRoZQoiSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9S
X0JVRERZIiBkZWZpbml0aW9uLiBJdCBnb3QgcmlkIG9mIF9hIGxvdF8gb2YKb3RoZXIgc3BlY2lh
bCBjYXNlcyAvIGNoZWNrcyBlbHNld2hlcmUgYW5kIGZlbHQgcXVpdGUgYSBiaXQgY2xlYW5lciB0
bwptZS4gSSBvbmx5IGhhZCB0byB0aGluayBhYm91dCB0aGUgY29uZmxpY3QgYmV0d2VlbiB0aGUg
ImJ1ZGR5IiBhbmQKIm5taSIgd2F0Y2hkb2dzIG9uY2Ugd2hlbiBJIHVuZGVyc3Rvb2QKIkhBVkVf
SEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWSIuCgoKPiA+IEFzIHBlciBhYm92ZSwgaXQncyBzaW1w
bHkgYSByZXNwb25zaWJpbGl0eSBvZiBhcmNoaXRlY3R1cmVzIG5vdCB0bwo+ID4gZGVmaW5lIHRo
YXQgdGhleSBoYXZlIGJvdGggInBlcmYiIGlmIHRoZXkgaGF2ZSB0aGUgTk1JIHdhdGNoZG9nLCBz
bwo+ID4gaXQncyBqdXN0IGJ1ZGR5IHRvIHdvcnJ5IGFib3V0Lgo+Cj4gV2hlcmUgaXMgdGhpcyBk
b2N1bWVudGVkLCBwbGVhc2U/Cj4gSXMgaXQgc2FmZSB0byBhc3N1bWUgdGhpcz8KCkl0J3Mgbm90
IHdlbGwgZG9jdW1lbnRlZCBhbmQgSSBhZ3JlZSB0aGF0IGl0IGNvdWxkIGJlIGltcHJvdmVkLiBS
aWdodApub3csIEhBVkVfTk1JX1dBVENIRE9HIGlzIGRvY3VtZW50ZWQgdG8gc2F5IHRoYXQgdGhl
IGFyY2hpdGVjdHVyZQoiZGVmaW5lcyBpdHMgb3duIGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCki
LiBMb29raW5nIGJlZm9yZSBteQpwYXRjaGVzLCB5b3UgY2FuIHNlZSB0aGF0ICJrZXJuZWwvd2F0
Y2hkb2dfaGxkLmMiICh0aGUgInBlcmYiIGRldGVjdG9yCmNvZGUpIHVuY29uZGl0aW9uYWxseSBk
ZWZpbmVzIGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkuIFRoYXQgd291bGQKZ2l2ZSB5b3UgYSBs
aW5rZXIgZXJyb3IuCgoKPiBJIHdvdWxkIHBlcnNvbmFsbHkgcHJlZmVyIHRvIGVuc3VyZSB0aGlz
IGJ5IHRoZSBjb25maWcgY2hlY2suCj4gSXQgaXMgZXZlbiBiZXR0ZXIgdGhhbiBkb2N1bWVudGF0
aW9uIGJlY2F1c2Ugbm9ib2R5IHJlYWRzCj4gZG9jdW1lbnRhdGlvbiA7LSkKClN1cmUuIElNTyB0
aGlzIHNob3VsZCBiZSBkb2N1bWVudGVkIGFzIGNsb3NlIGFzIHBvc3NpYmxlIHRvIHRoZSByb290
Cm9mIHRoZSBwcm9ibGVtLiBNYWtlICJIQVZFX05NSV9XQVRDSERPRyIgZGVwZW5kIG9uCiIhSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYiLiBUaGF0IGV4cHJlc3NlcyB0aGF0IGFuIGFyY2hp
dGVjdHVyZQppcyBub3QgYWxsb3dlZCB0byBkZWNsYXJlIHRoYXQgaXQgaGFzIGJvdGguCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBv
cnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
