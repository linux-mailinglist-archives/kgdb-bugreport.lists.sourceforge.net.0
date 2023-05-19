Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BCB70A952
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrA-0000tm-9m
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03o0-0005c2-3D
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TxsHOCJ1OWCqFtkIFidXd/8UskEhLhb6o5wuCVwA9p8=; b=cp7n6QK/1ITOKVwozIK+DCu99+
 1wFa5y2qL+H9rf32UE6TB6vtMUmH8Si6nbp472qTe/Nf8OPaIT8AzVeCl4dyOreI39R11cQHG6HQr
 fF1DHOv8vkXcX+WzmEGyn8XC9yZTXsipEt2mv1IbX25XNjeRSjYhd90IHp46kVdVHCkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxsHOCJ1OWCqFtkIFidXd/8UskEhLhb6o5wuCVwA9p8=; b=Hq/r8nZGWdZhroYv18/c/CqDTK
 9wTOLewc+tRV6T1EJAN+Ri9cwoyRYgfMntQ6YBNbJzQqmgErDrx2umxunQ5zsIQPHY1eynV4q3VNO
 0BS8Iqpv0VqkF7ITMe8QE6JWEwben2v5raXBjA93Jm6wogc/HRi4Wn7RUhiIqdFs+wh0=;
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03nw-00DXv9-8N for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:22:15 +0000
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-331333e6bf1so8693265ab.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516924; x=1687108924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TxsHOCJ1OWCqFtkIFidXd/8UskEhLhb6o5wuCVwA9p8=;
 b=nEp9ymEkd02rHW+O64+YI/P/tJWT1tbR/ZWUgyTzjpwAGGBfbCv1Pqw8rNElNiTzdv
 BdBFONV42Kz80AHuXKUOmZmPnO6S5RYtvh8/4RmTqreOREbRQATSU41WCNJML9tMSCSd
 eR3LjRqNrZvL9nhOzn0EXZlCJ6MMqkB1wLGnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516924; x=1687108924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TxsHOCJ1OWCqFtkIFidXd/8UskEhLhb6o5wuCVwA9p8=;
 b=QvTPgbwLH/jk1DxKGTB/iyTKTgDLaGFlTCPPicKrwCiR9c0bzPp9iZxlRWbKjiqAri
 GmNPNqKPUwdkRZPRC/rMzvWZDhAvxPDObQfWDYJIDTEutvbEvWIEzk0R3x4g8HLnfV6F
 NuVGgPXWJosRMJV6c9dbewC9+lFJker4/gyxXFA722vZ9z+BkvemaZwBUnnOMC4G2G5J
 0bqaXxAYh1dEsrVFGY5CHa8hP4ilgP21g2m+EhggwoCxEjx9cSLMVMCDb4NLdHOuC1rG
 bwE+iE3bsfNidBztF67b1YNkNgUO97I47Hbbz0Mx1Mg9/7h+MdMWqC3YrMnQsPwAVrZp
 ieZg==
X-Gm-Message-State: AC+VfDxVbQMVtiXcCcjpaNv5tw92oS6K6QUnAHje4ghBGcPRyemQHEkr
 QY9pCE84mhOpFU8LKElnIT5EDwlcnPKLtWve1l0=
X-Google-Smtp-Source: ACHHUZ65cnLjbeOFSjTUfq2lYYSw6fS/6Av0cxnGWHBOPYo4E0HLc7joZ2Cl0DMDpWkBfIaGTRRDdA==
X-Received: by 2002:a92:d301:0:b0:335:3568:dc67 with SMTP id
 x1-20020a92d301000000b003353568dc67mr1544226ila.15.1684516924280; 
 Fri, 19 May 2023 10:22:04 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05663812c200b0040faf78330asm1320085jas.28.2023.05.19.10.22.02
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 10:22:03 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-335d6260e9bso5985ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:22:02 -0700 (PDT)
X-Received: by 2002:a92:c266:0:b0:338:1993:1194 with SMTP id
 h6-20020a92c266000000b0033819931194mr230509ild.2.1684516922186; Fri, 19 May
 2023 10:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
 <ZFz4TVOyEU51b898@alley>
In-Reply-To: <ZFz4TVOyEU51b898@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 10:21:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VOdFsdSK5X_8v3YFqDWQhDEYfo5Jkut7=G8TB=+KBKrQ@mail.gmail.com>
Message-ID: <CAD=FV=VOdFsdSK5X_8v3YFqDWQhDEYfo5Jkut7=G8TB=+KBKrQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 11, 2023 at 7:14 AM Petr Mladek <pmladek@suse.com>
    wrote: > > On Thu 2023-05-04 15:13:41, Douglas Anderson wrote: > > In preparation
    for the buddy hardlockup detector where the CPU > > c [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.173 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03nw-00DXv9-8N
Subject: Re: [Kgdb-bugreport] [PATCH v4 09/17] watchdog/hardlockup: Add a
 "cpu" param to watchdog_hardlockup_check()
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCA3OjE04oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1IDIwMjMtMDUtMDQgMTU6MTM6NDEsIERvdWds
YXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgdGhlIGJ1ZGR5IGhhcmRs
b2NrdXAgZGV0ZWN0b3Igd2hlcmUgdGhlIENQVQo+ID4gY2hlY2tpbmcgZm9yIGxvY2t1cCBtaWdo
dCBub3QgYmUgdGhlIGN1cnJlbnRseSBydW5uaW5nIENQVSwgYWRkIGEKPiA+ICJjcHUiIHBhcmFt
ZXRlciB0byB3YXRjaGRvZ19oYXJkbG9ja3VwX2NoZWNrKCkuCj4gPgo+ID4gLS0tIGEva2VybmVs
L3dhdGNoZG9nLmMKPiA+ICsrKyBiL2tlcm5lbC93YXRjaGRvZy5jCj4gPiBAQCAtOTIsMTQgKzky
LDE0IEBAIHN0YXRpYyBERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBsb25nLCBocnRpbWVyX2ludGVy
cnVwdHNfc2F2ZWQpOwo+ID4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVShib29sLCB3YXRjaGRvZ19o
YXJkbG9ja3VwX3Byb2Nlc3NlZCk7Cj4gPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgd2F0Y2hkb2df
aGFyZGxvY2t1cF9kdW1wZWRfc3RhY2tzOwo+ID4KPiA+IC1zdGF0aWMgYm9vbCB3YXRjaGRvZ19o
YXJkbG9ja3VwX2lzX2xvY2tlZHVwKHZvaWQpCj4gPiArc3RhdGljIGJvb2wgd2F0Y2hkb2dfaGFy
ZGxvY2t1cF9pc19sb2NrZWR1cCh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gIHsKPiA+IC0gICAgIHVu
c2lnbmVkIGxvbmcgaHJpbnQgPSBfX3RoaXNfY3B1X3JlYWQoaHJ0aW1lcl9pbnRlcnJ1cHRzKTsK
PiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgaHJpbnQgPSBwZXJfY3B1KGhydGltZXJfaW50ZXJydXB0
cywgY3B1KTsKPgo+IE15IHJhZGFyIHRlbGxzIG1lIHRoYXQgdGhpcyBzaG91bGQgYmUKPiBSRUFE
X09OQ0UocGVyX2NwdShocnRpbWVyX2ludGVycnVwdHMsIGNwdSkpIHdoZW4gdGhlIHZhbHVlIG1p
Z2h0Cj4gYmUgbW9kaWZpZWQgb24gYW5vdGhlciBDUFUuIE90aGVyd2lzZSwgdGhlIGNvbXBpbGVy
IGlzIGFsbG93ZWQKPiB0byBzcGxpdCB0aGUgcmVhZCBpbnRvIG1vcmUgaW5zdHJ1Y3Rpb25zLgo+
Cj4gSXQgd2lsbCBiZSBuZWVkZWQgZm9yIHRoZSBidWRkeSBkZXRlY3Rvci4gQW5kIGl0IHdpbGwg
cmVxdWlyZQo+IGFsc28gaW5jcmVtZW50aW5nIHRoZSB2YWx1ZSBpbiB3YXRjaGRvZ19oYXJkbG9j
a3VwX2ludGVycnVwdF9jb3VudCgpCj4gYW4gYXRvbWljIHdheS4KPgo+IE5vdGUgdGhhdCBfX3Ro
aXNfY3B1X2luY19yZXR1cm4oKSBkb2VzIG5vdCBndWFyYW50ZWUgYXRvbWljaXR5Cj4gYWNjb3Jk
aW5nIHRvIG15IHVuZGVyc3RhbmRpbmcuIEluIHRoZW9yeSwgdGhlIGZvbGxvd2luZyBzaG91bGQK
PiB3b3JrIGJlY2F1c2UgY291bnRlciB3aWxsIG5ldmVyIGJlIGluY3JlbWVudGVkIGluIHBhcmFs
bGVsOgo+Cj4gc3RhdGljIHVuc2lnbmVkIGxvbmcgd2F0Y2hkb2dfaGFyZGxvY2t1cF9pbnRlcnJ1
cHRfY291bnQodm9pZCkKPiB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGNvdW50Owo+Cj4gICAg
ICAgICBjb3VudCA9IF9fdGhpc19jcHVfcmVhZChocnRpbWVyX2ludGVycnVwdHMpOwo+ICAgICAg
ICAgY291bnQrKzsKPiAgICAgICAgIFdSSVRFX09OQ0UoKnJhd19jcHVfcHRyKGhydGltZXJfaW50
ZXJydXB0cyksIGNvdW50KTsKPiB9Cj4KPiBidXQgaXQgaXMgbmFzdHkuIEEgbW9yZSBlbGVnYW50
IHNvbHV0aW9uIG1pZ2h0IGJlIHVzaW5nIGF0b21pY190Cj4gZm9yIGhydGltZXJfaW50ZXJydXB0
cyBjb3VudGVyLgoKSSBzd2l0Y2hlZCBpdCBvdmVyIHRvIGF0b21pY190LgoKCj4gPiAtICAgICBp
ZiAoX190aGlzX2NwdV9yZWFkKGhydGltZXJfaW50ZXJydXB0c19zYXZlZCkgPT0gaHJpbnQpCj4g
PiArICAgICBpZiAocGVyX2NwdShocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQsIGNwdSkgPT0gaHJp
bnQpCj4gPiAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4KPiA+IC0gICAgIF9fdGhpc19j
cHVfd3JpdGUoaHJ0aW1lcl9pbnRlcnJ1cHRzX3NhdmVkLCBocmludCk7Cj4gPiArICAgICBwZXJf
Y3B1KGhydGltZXJfaW50ZXJydXB0c19zYXZlZCwgY3B1KSA9IGhyaW50Owo+Cj4gSU1ITywgaHJ0
aW1lcl9pbnRlcnJ1cHRzX3NhdmVkIG1pZ2h0IGJlIGhhbmRsZWQgdGhpcyB3YXkuCj4gVGhlIHZh
bHVlIGlzIHJlYWQvd3JpdHRlbiBvbmx5IGJ5IHRoaXMgZnVuY3Rpb24uCj4KPiBUaGUgYnVkZHkg
d2F0Y2hkb2cgc2hvdWxkIHNlZSBjb25zaXN0ZW50IHZhbHVlcyBldmVuIHdoZW4KPiB0aGUgYnVk
ZHkgQ1BVIGdvZXMgb2ZmbGluZS4gVGhpcyBjaGVjayBzaG91bGQgbmV2ZXIgcmFjZQo+IGJlY2F1
c2UgdGhpcyBDUFUgc2hvdWxkIGdldCB0b3VjaGVkIHdoZW4gYW5vdGhlciBidWRkeQo+IGdldHMg
YXNzaWduZWQuCj4KPiBXZWxsLCBpdCB3b3VsZCBkZXNlcnZlIGEgY29tbWVudC4KCkkgc3BlbnQg
YSBidW5jaCBvZiB0aW1lIHRoaW5raW5nIGFib3V0IHRoaXMgdG9vIGFuZCBJIGFncmVlIHRoYXQg
Zm9yCmhydGltZXJfaW50ZXJydXB0c19zYXZlZCB3ZSBkb24ndCBuZWVkIGF0b21pY190IG5vciBl
dmVuClJFQURfT05DRS9XUklURV9PTkNFLiBJJ3ZlIGFkZCBhIGNvbW1lbnQgYW5kIGEgbm90ZSBp
biB0aGUgY29tbWl0Cm1lc3NhZ2UgaW4gdjUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVn
cmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
