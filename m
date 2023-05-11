Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC536FF47D
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 16:35:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px7Nm-0001I6-Qm
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 14:35:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1px7Nj-0001Hn-Tq
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 14:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDAnVIuo236iFwX8Q4PwBvcDGXZtwfSqujw0bG7p3X0=; b=dZdIDiIZBibFXRz7tlkLkNgg7l
 G2QNGqu+qAcWtMGs3hNx0Fv8bxSuLChQPOhKrGd3zkedyPuKIlw6HgLwGYvSCPKeYpjSRd/Huha8u
 KalxSZWwB/+P/k3MVSmWJNxkPvuBIL5yOFTGGXnheL/8FM/WcBei2kfRySqAY7LF05Po=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RDAnVIuo236iFwX8Q4PwBvcDGXZtwfSqujw0bG7p3X0=; b=CowZwzWXxUH3sIoYQMnFJHnMnE
 ejkP+0Wy1dx/8WIvZasgOwNCxbWZyty036xi5V6y0IC3aff46RrNULsp7uAYQUSyKutb7BcOlrwMc
 Op5rozAnbDZYAJpZ5Siif4IrzbQQytsrc0YB4VgL6zWWHt17OnYt6ROC8ypMfpfF6oTU=;
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px7Ne-0005fR-GP for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 14:34:59 +0000
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7577a91cfd6so261855485a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 11 May 2023 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683815688; x=1686407688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDAnVIuo236iFwX8Q4PwBvcDGXZtwfSqujw0bG7p3X0=;
 b=P7DecjB8ZMeCZYwkxxsNCSOOAgyMkv5tU/XZqQtnIcNLOQBM6XJeRQS3Iav4nMcJt4
 Ta8guLRSewlcGwVVy35Wr1zjbOhSrL0QfZ1PCgZyLzzJ99FCwywNVSBTd7syngCiIec1
 uN5XBrwZRSnj4EvM3rvLtcwkSot2aFDa+9Zog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683815688; x=1686407688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RDAnVIuo236iFwX8Q4PwBvcDGXZtwfSqujw0bG7p3X0=;
 b=l/kuTwB+8XgkPqa9BNIqFY4Z+L1kpZep3XLPqMo3wp15Jn3XehuQ97VqnmS+V1Lz2M
 o6UTG3Ah5J70doXR9gMZOwKlextUvUvwfMETHWHWAy4SXgKU7n2ObuYcMfivbAA8X83t
 amjksxvvsaa9EvjuMizWxi34vKA3OMay3YCUZgGcIvGxCc6MvE7FmxSJL0ZoGGOVakp+
 SnZ6lSgxo5pGcWCg6G1X3x8AYsl9H00HyuU0SyQW8rU+1HUD+LZSX/y2/Mx2YMxcApXL
 I9hBVikXI8kQT9USbvvlzn7M6dZ8Cbuj9Li/NDY+6zecP6GdpJS4nVDT8QQhrPIYIme1
 xK+g==
X-Gm-Message-State: AC+VfDwpdd+Ah+VslHuwv3pemmLJ/Jjq6bxc//GEEM09XIuK/jgaz9da
 AdcR6THeheXtqD0fJ2Vc+uenCzPFleBJkWvCUqFduA==
X-Google-Smtp-Source: ACHHUZ6MmdhAsgh9RC4vUEedz9p4GSYUcJ25NC/3U5FHjdyIT600KnpuYnMX7efDjPB9q+pfHOvqEw==
X-Received: by 2002:a05:6214:21a1:b0:61b:5bb0:a236 with SMTP id
 t1-20020a05621421a100b0061b5bb0a236mr28587836qvc.48.1683815687913; 
 Thu, 11 May 2023 07:34:47 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181]) by smtp.gmail.com with ESMTPSA id
 y11-20020a0ceacb000000b0060f5a75b750sm2316538qvp.99.2023.05.11.07.34.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 07:34:43 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-3f38824a025so789471cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 11 May 2023 07:34:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1a05:b0:3f3:9c91:fee7 with SMTP id
 f5-20020a05622a1a0500b003f39c91fee7mr421512qtb.16.1683815682956; Thu, 11 May
 2023 07:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.8.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
In-Reply-To: <20230419155341.v8.8.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 May 2023 07:34:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=tm_smsi9itwK_Ku2vU0d676JT+MK3fkALn5QMsduiQ@mail.gmail.com>
Message-ID: <CAD=FV=X=tm_smsi9itwK_Ku2vU0d676JT+MK3fkALn5QMsduiQ@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Apr 19, 2023 at 3:57 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > To save architectures from needing to wrap the call in #ifdefs,
    add a > stub no-op version of kgdb_nmicallback(), [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.176 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1px7Ne-0005fR-GP
Subject: Re: [Kgdb-bugreport] [PATCH v8 08/10] kgdb: Provide a stub
 kgdb_nmicallback() if !CONFIG_KGDB
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAzOjU34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFRvIHNhdmUgYXJjaGl0ZWN0dXJlcyBm
cm9tIG5lZWRpbmcgdG8gd3JhcCB0aGUgY2FsbCBpbiAjaWZkZWZzLCBhZGQgYQo+IHN0dWIgbm8t
b3AgdmVyc2lvbiBvZiBrZ2RiX25taWNhbGxiYWNrKCksIHdoaWNoIHJldHVybnMgMSBpZiBpdCBk
aWRuJ3QKPiBoYW5kbGUgYW55dGhpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY4Ogo+IC0g
IlByb3ZpZGUgYSBzdHViIGtnZGJfbm1pY2FsbGJhY2soKSBpZiAhQ09ORklHX0tHREIiIG5ldyBm
b3IgdjgKPgo+ICBpbmNsdWRlL2xpbnV4L2tnZGIuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2tnZGIuaCBiL2lu
Y2x1ZGUvbGludXgva2dkYi5oCj4gaW5kZXggODc3MTNiZDM5MGYzLi45Y2U2MjhlZTQ3Y2MgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rZ2RiLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2tn
ZGIuaAo+IEBAIC0zNzcsNSArMzc3LDYgQEAgZXh0ZXJuIHZvaWQga2dkYl9mcmVlX2luaXRfbWVt
KHZvaWQpOwo+ICAjZGVmaW5lIGRiZ19sYXRlX2luaXQoKQo+ICBzdGF0aWMgaW5saW5lIHZvaWQg
a2dkYl9wYW5pYyhjb25zdCBjaGFyICptc2cpIHt9Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBrZ2Ri
X2ZyZWVfaW5pdF9tZW0odm9pZCkgeyB9Cj4gK3N0YXRpYyBpbnQga2dkYl9ubWljYWxsYmFjayhp
bnQgY3B1LCB2b2lkICpyZWdzKSB7IHJldHVybiAxOyB9CgpGV0lXOiBJIGp1c3QgcmVhbGl6ZWQg
dGhhdCB0aGUgYWJvdmUgbmVlZHMgYW4gImlubGluZSIgdG8gbWFrZSB0aGUKY29tcGlsZXIgbm90
IGNvbXBsYWluLiBJJ20gc3RpbGwgaG9waW5nIGZvciBtb3JlIGZlZWRiYWNrIG9uIHRoZQpzZXJp
ZXMsIGJ1dCBJJ2xsIHBsYW4gdG8gZml4IHRoYXQgaW4gdGhlIG5leHQgc3Bpbi4KCi1Eb3VnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
