Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915D70A959
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrC-0000vB-0E
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q041Y-0005n0-QW
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O7bXuAl2er6jMvvw+SQdriEgYnLYrf51RQ1JCNcE4RU=; b=Y7Nh3TFUA3Ej5BBznn4TrsHz4Y
 175p+lAf9IwEBowIycLAbWw2ScirDXVjieZPxZoJvqFZf9BStQfDo9CIoZoB0r60QG2GhkE1F6Gel
 SnifqTJ9g0R/sexuCXgg/prwGLIu9madGhIVNEp78rn7BqXG/VuhHtbS0DxDXDjLVIsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O7bXuAl2er6jMvvw+SQdriEgYnLYrf51RQ1JCNcE4RU=; b=kpCWrce/6VjFMPHIensBUyjHLE
 tG5njj6JTfjVBIe2zRR/xtjq4uDFKbk/HvIGN7ZTBtscijk11Goy24asctkChTbqAgk5LdhSMST0n
 hoL6BjbSBe9T8P5vbKzzLDBPpRQxX0pxR0aSS8IkXbzAA0unFrGVeXvBM25VnvvHYN7w=;
Received: from mail-qv1-f50.google.com ([209.85.219.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q041Y-0007ZJ-1L for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:36:16 +0000
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-623802d9bfdso25644226d6.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684517769; x=1687109769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7bXuAl2er6jMvvw+SQdriEgYnLYrf51RQ1JCNcE4RU=;
 b=mlkpbBeEPbqKvRBWdPyeRtH3sJRSL7Vphy+UUe4eargKIg0UQ+WD7bUrswEfLZtzDe
 r98EhBE9sfvkPBHXeVZhavCUF9dIhuKR2BKi7dxRO4YkioCJKLlTiJMATHiTCqewXHNc
 FEWgH6GGzkdpxWHahV38z+NG3yedwVVUz9mNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684517769; x=1687109769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7bXuAl2er6jMvvw+SQdriEgYnLYrf51RQ1JCNcE4RU=;
 b=F3XxWgomiDCXifye4Cde7B3BvCiFgNUDP0lHW/83kcSI3gDPWN077f/nvyiPfESplB
 9cFmiAOK0eBklFAfxUqF2v+ntxN7rUHhzrVXn/zeZA2EEVwxs+nG/zHc+k40mvO+VzNA
 bHZk9ShMBg2iA4YXh5IarKNmfwfqEZGlqfqKLbAt9qvDMXroy4+FvuJvjkF/Z/UUFhDa
 no1V5UrxnebK1ybJn7tQt4GcqUnrMi6Ut6IRlkM4V7SPUwKr0eXAH8x0mtTP9htvyZgv
 V7D7Ppyns0ZHVcRQCpJGSutrgpnX+k4hhuHp4XiJ9LSbNtGVfAWTZQjNpCUQTDo9g4Bn
 40wA==
X-Gm-Message-State: AC+VfDyx106C4gRxFOMX0Chl5NAz/8FdEZZ9dLeTXBjUbvJSSLqwB7n/
 Nddh85CHgZvR5KNZApnbdFbpQg3rg7KMUiil/DQ=
X-Google-Smtp-Source: ACHHUZ5FtvkUnvGu+MzoAHLNwNsP5PvKsCqUOHG5D6BN7KLPFC6d48W/i/iCuK2Gg805u7IUFlP9Kg==
X-Received: by 2002:a67:ba13:0:b0:434:8401:beb5 with SMTP id
 l19-20020a67ba13000000b004348401beb5mr1278341vsn.35.1684517354472; 
 Fri, 19 May 2023 10:29:14 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43]) by smtp.gmail.com with ESMTPSA id
 y23-20020ab05b97000000b0077d097c7f86sm782224uae.24.2023.05.19.10.29.14
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 10:29:14 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-783e5c64d29so781238241.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:29:14 -0700 (PDT)
X-Received: by 2002:a05:6602:1548:b0:76c:e93a:e2a with SMTP id
 h8-20020a056602154800b0076ce93a0e2amr7743221iow.8.1684516998834; Fri, 19 May
 2023 10:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
 <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
 <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
 <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
In-Reply-To: <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 May 2023 10:23:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X53VnS37YXkGUT7W=1ekS1YgznCbOiBQBSHuZLqpHa_A@mail.gmail.com>
Message-ID: <CAD=FV=X53VnS37YXkGUT7W=1ekS1YgznCbOiBQBSHuZLqpHa_A@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, May 8, 2023 at 8:52 AM Doug Anderson <dianders@chromium.org>
    wrote: > > Hmmm, but I don't think you really need "all-to-all" checking
   to get > the stacktraces you want, do you? Each CPU can [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.50 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q041Y-0007ZJ-1L
Subject: Re: [Kgdb-bugreport] [PATCH v4 13/17] watchdog/hardlockup: detect
 hard lockups using secondary (buddy) CPUs
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
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE1heSA4LCAyMDIzIGF0IDg6NTLigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSG1tbSwgYnV0IEkgZG9uJ3QgdGhpbmsgeW91
IHJlYWxseSBuZWVkICJhbGwtdG8tYWxsIiBjaGVja2luZyB0byBnZXQKPiB0aGUgc3RhY2t0cmFj
ZXMgeW91IHdhbnQsIGRvIHlvdT8gRWFjaCBDUFUgY2FuIGJlICJ3YXRjaGluZyIgZXhhY3RseQo+
IG9uZSBvdGhlciBDUFUsIGJ1dCB0aGVuIHdoZW4gd2UgYWN0dWFsbHkgbG9jayB1cCB3ZSBjb3Vs
ZCBjaGVjayBhbGwgb2YKPiB0aGVtIGFuZCBkdW1wIHN0YWNrcyBvbiBhbGwgdGhlIG9uZXMgdGhh
dCBhcmUgbG9ja2VkIHVwLiBJIHRoaW5rIHRoaXMKPiB3b3VsZCBiZSBhIGZhaXJseSBlYXN5IGlt
cHJvdmVtZW50IGZvciB0aGUgYnVkZHkgc3lzdGVtLiBJJ2xsIGxlYXZlIGl0Cj4gb3V0IGZvciBu
b3cganVzdCB0byBrZWVwIHRoaW5ncyBzaW1wbGUgZm9yIHRoZSBpbml0aWFsIGxhbmRpbmcsIGJ1
dCBpdAo+IHdvdWxkbid0IGJlIGhhcmQgdG8gYWRkLiBUaGVuIEkgdGhpbmsgdGhlIHR3byBTTVAg
c3lzdGVtcyAgKGJ1ZGR5IHZzLgo+IGFsbC10by1hbGwpIHdvdWxkIGJlIGVxdWl2YWxlbnQgaW4g
dGVybXMgb2YgZnVuY3Rpb25hbGl0eT8KCkZXSVcsIEkgdGFrZSBiYWNrIG15ICJ0aGlzIHdvdWxk
IGJlIGZhaXJseSBlYXN5IiBjb21tZW50LiA6LVAgLi4ub3IsCmF0IGxlYXN0IEknbGwgYWNrbm93
bGVkZ2UgdGhhdCB0aGUgZWFzeSB3YXkgaGFzIHNvbWUgdHJhZGVvZmZzLiBJdAp3b3VsZG4ndCBi
ZSB0cml2aWFsbHkgZWFzeSB0byBqdXN0IHNub29wIG9uIHRoZSBkYXRhIG9mIHRoZSBvdGhlcgpi
dWRkaWVzIGJlY2F1c2UgdGhlIHdhdGNoaW5nIHByb2Nlc3NvcnMgYXJlbid0IG5lY2Vzc2FyaWx5
CnN5bmNocm9uaXplZCB3aXRoIGVhY2ggb3RoZXIuCgpUaGF0IGJlaW5nIHNhaWQsIGlmIHNvbWVv
bmUgcmVhbGx5IHdhbnRlZCB0byByZXBvcnQgb24gb3RoZXIgbG9ja2VkCkNQVXMgYmVmb3JlIGRv
aW5nIGEgcGFuaWMoKSBhbmQgd2FzIHdpbGxpbmcgdG8gZGVsYXkgdGhlIHBhbmljLCBpdApwcm9i
YWJseSB3b3VsZG4ndCBiZSB0b28gaGFyZCB0byBwdXQgaW4gYSBtb2RlIHdoZXJlIHRoZSBDUFUg
dGhhdApkZXRlY3RzIHRoZSBmaXJzdCBsb2NrdXAgY291bGQgZG8gc29tZSBleHRyYSB3b3JrIHRv
IGxvb2sgZm9yIGxvY2t1cHMuCk1heWJlIGl0IGNvdWxkIHNlbmQgYSBub3JtYWwgSVBJIHRvIG90
aGVyIENQVXMgYW5kIHNlZSBpZiB0aGV5IHJlc3BvbmQKb3IgbWF5YmUgaXQgY291bGQgdGFrZSBv
dmVyIG1vbml0b3JpbmcgYWxsIENQVXMgYW5kIHdhaXQgb25lIGV4dHJhCnBlcmlvZC4KCkluIGFu
eSBjYXNlLCBJJ20gbm90IHBsYW5uaW5nIG9uIGltcGxlbWVudGluZyB0aGlzIG5vdywgYnV0IGF0
IGxlYXN0CndhbnRlZCB0byBkb2N1bWVudCB0aG91Z2h0cy4gOy0pCgo+IFdpdGggbXkgc2ltcGxp
c3RpYyBzb2x1dGlvbgo+IG9mIGp1c3QgYWxsb3dpbmcgdGhlIGJ1ZGR5IGRldGVjdG9yIHRvIGJl
IGVuYWJsZWQgaW4gcGFyYWxsZWwgd2l0aCBhCj4gcGVyZi1iYXNlZCBkZXRlY3RvciB0aGVuIHdl
IHdvdWxkbid0IGhhdmUgdGhpcyBsZXZlbCBvZiBjb29yZGluYXRpb24sCj4gYnV0IEknbGwgYXNz
dW1lIHRoYXQncyBPSyBmb3IgdGhlIGluaXRpYWwgbGFuZGluZy4KCkkgZHVnIGludG8gdGhpcyBt
b3JlIGFzIHdlbGwgYW5kIEkgYWxzbyB3YW50ZWQgdG8gbm90ZSB0aGF0LCBhdCBsZWFzdApmb3Ig
bm93LCBJJ20gbm90IGdvaW5nIHRvIGluY2x1ZGUgc3VwcG9ydCB0byB0dXJuIG9uIGJvdGggdGhl
IGJ1ZGR5CmFuZCBwZXJmIGxvY2t1cCBkZXRlY3RvcnMgaW4gdGhlIGNvbW1vbiBjb3JlLiBJbiBv
cmRlciB0byBkbyB0aGlzIGFuZApub3QgaGF2ZSB0aGVtIHN0b21wIG9uIGVhY2ggb3RoZXIgdGhl
biBJIHRoaW5rIHdlIG5lZWQgZXh0cmEKY29vcmRpbmF0aW9uIG9yIHR3byBjb3BpZXMgb2YgdGhl
IGludGVycnVwdCBjb3VudCAvIHNhdmVkIGludGVycnVwdApjb3VudCBhbmQsIGF0IGxlYXN0IGF0
IHRoaXMgcG9pbnQgaW4gdGltZSwgaXQgZG9lc24ndCBzZWVtIHdvcnRoIGl0CmZvciBhIGhhbGZ3
YXkgc29sdXRpb24uIEZyb20gZXZlcnl0aGluZyBJJ3ZlIGhlYXJkIHRoZXJlIGlzIGEgcHVzaCBv
bgptYW55IHg4NiBtYWNoaW5lcyB0byBnZXQgb2ZmIHRoZSBwZXJmIGxvY2t1cCBkZXRlY3RvciBh
bnl3YXkgdG8gZnJlZQp1cCB0aGUgcmVzb3VyY2VzLiBTb21lb25lIGNvdWxkIGxvb2sgYXQgYWRk
aW5nIHRoaXMgY29tcGxleGl0eSBsYXRlci4KCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
