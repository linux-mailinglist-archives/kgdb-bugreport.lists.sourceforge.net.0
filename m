Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCB47273A5
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 02:20:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q73OD-0000Ey-5n
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 00:20:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q73O9-0000Er-75
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 00:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nhl3RV14fXn8RdG370rcvuPNBbtc0Bpx0+NmOZMVtZc=; b=ZbGBbHcl1ia9WsTaf3q5mgBaJu
 YsmXRwszDY/UEjr7b5QfChZ+rHr7iMfdmhRg+PeIbAV+UPFnsen0yAzvRMja7KK1CcSscWmzlpGj/
 fBGDUKbcrwjD8fYL/7FsQXWXEBIyCvdPF/yiczZOf7e4CbBHbZuZS5VMjnmlrB/GQYIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nhl3RV14fXn8RdG370rcvuPNBbtc0Bpx0+NmOZMVtZc=; b=UGMmGmKFrgIo+lwLAi/jY8RtvG
 FqZe6JB+gNecUwOJM098nf7MA6FGclgULD/PwL9pkz4TDQW9pSzQEynplsbaz4BYW8W8Oq2U6B9z9
 +/7sI2gBUSsJFcDhIQOGrd/NH3Q7DQAAdB8YUahFUkqJNuvvC1tLYZdRcHWEC2EN9keY=;
Received: from mail-yb1-f181.google.com ([209.85.219.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q73O6-0003Lk-4u for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 00:20:29 +0000
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-bacbc7a2998so121386276.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 17:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686183620; x=1688775620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhl3RV14fXn8RdG370rcvuPNBbtc0Bpx0+NmOZMVtZc=;
 b=hCMJ2Bwo/StEn6wUSXay0F/4c9uEgGmLBeXoMgNabFY5nX028EznBexkwNfh7JnU3C
 ecUBEe21gR3eC8bcnyTR8ekSPz5L6uFTZhZo3uuDrI5gt45fq9mrTuzGTcVmiE7SY4U9
 mmqiMGF+pzhgx0DQsSVzSor0UjIScs3h9gU/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686183620; x=1688775620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhl3RV14fXn8RdG370rcvuPNBbtc0Bpx0+NmOZMVtZc=;
 b=OIIEVpFaDmNbHxDSHEv4P4PLFrBd1FoLvid1C03gtLELq8wy81PYMTgqGslZyE0HUJ
 W6EA7anHKln+F7XeLSn0hSus44qDv8bksXvho7xjZrrBxb8ISZ/lA19lq6vA+FJfG1cZ
 5x3Hdf/wgBng3ecoGgvgn3jknNzGbBEX70nA0869aNFaycxJLlaIyv1dbUnhGoK/O3/9
 BmMqTj/bijKVfZi6p4QgNB623zDmMxTdG4dukOC5i6KYaWIZjIzrnNrxmFDz7/fp5E8D
 Ln1emqJGLRHK7hK3bKN2+I3TVuy8MNIUYzpbP5+N3vf6zCZH7J6HDfmcKR60N8MFI/xm
 PHXg==
X-Gm-Message-State: AC+VfDwT84UUdB4fE3gSWMT1T6CtQzdqGzlj9BMDx709qj46E/Qr6BM6
 IaPzxFY8ckmMqByXZTC+ULahAePkTcxuGVfWuBY=
X-Google-Smtp-Source: ACHHUZ5bk0YMbQjTvIWScnzueJeH4p5l5XhzTzMM5eGbdaFiyVZtd0jA8UI6tx3RGmePp9v2I/6DYg==
X-Received: by 2002:a05:6358:b506:b0:129:1c2e:6487 with SMTP id
 de6-20020a056358b50600b001291c2e6487mr3256479rwb.13.1686183190870; 
 Wed, 07 Jun 2023 17:13:10 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com.
 [209.85.214.182]) by smtp.gmail.com with ESMTPSA id
 u16-20020a63f650000000b00502f4c62fd3sm38788pgj.33.2023.06.07.17.13.10
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 17:13:10 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1b1b51ec3e9so74525ad.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 17:13:10 -0700 (PDT)
X-Received: by 2002:a92:c54d:0:b0:33e:6b65:6f78 with SMTP id
 a13-20020a92c54d000000b0033e6b656f78mr16489ilj.27.1686181007418; Wed, 07 Jun
 2023 16:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-5-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-5-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:36:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
Message-ID: <CAD=FV=VV3Y7KoZWPtZfmfRsUCftAgo_CLRDazrYSgbR2XJKf=g@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com>
    wrote: > > diff --git a/arch/Kconfig b/arch/Kconfig > index 13c6e596cf9e..57f15babe188
    100644 > --- a/arch/Kconfig > +++ b/arch/Kconfig [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.181 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.181 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q73O6-0003Lk-4u
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] watchdog/hardlockup: Enable
 HAVE_NMI_WATCHDOG only on sparc64
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
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9LY29uZmlnIGIvYXJjaC9L
Y29uZmlnCj4gaW5kZXggMTNjNmU1OTZjZjllLi41N2YxNWJhYmUxODggMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9LY29uZmlnCj4gKysrIGIvYXJjaC9LY29uZmlnCj4gQEAgLTQwNCwxMCArNDA0LDkgQEAg
Y29uZmlnIEhBVkVfTk1JX1dBVENIRE9HCj4gICAgICAgICBkZXBlbmRzIG9uIEhBVkVfTk1JCj4g
ICAgICAgICBib29sCj4gICAgICAgICBoZWxwCj4gLSAgICAgICAgIFRoZSBhcmNoIHByb3ZpZGVz
IGl0cyBvd24gaGFyZGxvY2t1cCBkZXRlY3RvciBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFkCj4gKyAg
ICAgICAgIFNwYXJjNjQgcHJvdmlkZXMgaXRzIG93biBoYXJkbG9ja3VwIGRldGVjdG9yIGltcGxl
bWVudGF0aW9uIGluc3RlYWQKPiAgICAgICAgICAgb2YgdGhlIGdlbmVyaWMgcGVyZiBvbmUuCgpJ
dCdzIGEgbGl0dGxlIHdlaXJkIHRvIGRvY3VtZW50IGdlbmVyaWMgdGhpbmdzIHdpdGggdGhlIHNw
ZWNpZmljcyBvZgp0aGUgdXNlci4gVGhlIGV4Y2VwdGlvbiwgSU1PLCBpcyB3aGVuIHNvbWV0aGlu
ZyBpcyBkZXByZWNhdGVkLgpQZXJzb25hbGx5LCBpdCB3b3VsZCBzb3VuZCBsZXNzIHdlaXJkIHRv
IG1lIHRvIHNheSBzb21ldGhpbmcgbGlrZToKClRoZSBhcmNoIHByb3ZpZGVzIGl0cyBvd24gaGFy
ZGxvY2t1cCBkZXRlY3RvciBpbXBsZW1lbnRhdGlvbiBpbnN0ZWFkCm9mIHRoZSBnZW5lcmljIHBl
cmYgb25lLiBUaGlzIGlzIGEgZGVwcmVjYXRlZCB0aGluZyB0byBkbyBhbmQga2VwdAphcm91bmQg
dW50aWwgc3BhcmM2NCBwcm92aWRlcyBhIGZ1bGwgaGFyZGxvY2t1cCBpbXBsZW1lbnRhdGlvbiBv
cgptb3ZlcyB0byBnZW5lcmljIGNvZGUuCgoKPiBkaWZmIC0tZ2l0IGEvbGliL0tjb25maWcuZGVi
dWcgYi9saWIvS2NvbmZpZy5kZWJ1Zwo+IGluZGV4IGQyMDFmNWQzODc2Yi4uNGI0YWEwZjk0MWY5
IDEwMDY0NAo+IC0tLSBhL2xpYi9LY29uZmlnLmRlYnVnCj4gKysrIGIvbGliL0tjb25maWcuZGVi
dWcKPiBAQCAtMTA1MCwxNSArMTA1MCwxMyBAQCBjb25maWcgSEFWRV9IQVJETE9DS1VQX0RFVEVD
VE9SX0JVRERZCj4gICMgICAgICBzcGFyYzY0OiBoYXMgYSBjdXN0b20gaW1wbGVtZW50YXRpb24g
d2hpY2ggaXMgbm90IHVzaW5nIHRoZSBjb21tb24KPiAgIyAgICAgICAgICAgICAgaGFyZGxvY2t1
cCBjb21tYW5kIGxpbmUgb3B0aW9ucyBhbmQgc3lzY3RsIGludGVyZmFjZS4KPiAgIwo+IC0jIE5v
dGUgdGhhdCBIQVZFX05NSV9XQVRDSERPRyBpcyB1c2VkIHRvIGRpc3Rpbmd1aXNoIHRoZSBzcGFy
YzY0IHNwZWNpZmljCj4gLSMgaW1wbGVtZW50YWlvbi4gSXQgaXMgYXV0b21hdGljYWxseSBlbmFi
bGVkIGFsc28gZm9yIG90aGVyIGFyY2gtc3BlY2lmaWMKPiAtIyB2YXJpYW50cyB3aGljaCBzZXQg
SEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0guIEl0IG1ha2VzIHRoZSBjaGVjawo+IC0jIG9m
IGF2YWlhbGFibGUgYW5kIHN1cHBvcnRlZCB2YXJpYW50cyBxdWl0ZSB0cmlja3kuCj4gKyMgTm90
ZSB0aGF0IEhBVkVfTk1JX1dBVENIRE9HIGlzIHNldCB3aGVuIHRoZSBzcGFyYzY0IHNwZWNpZmlj
IGltcGxlbWVudGF0aW9uCj4gKyMgaXMgdXNlZC4KPiAgIwo+ICBjb25maWcgSEFSRExPQ0tVUF9E
RVRFQ1RPUgo+ICAgICAgICAgYm9vbCAiRGV0ZWN0IEhhcmQgTG9ja3VwcyIKPiAtICAgICAgIGRl
cGVuZHMgb24gREVCVUdfS0VSTkVMICYmICFTMzkwCj4gLSAgICAgICBkZXBlbmRzIG9uICgoSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JV
RERZKSAmJiAhSEFWRV9OTUlfV0FUQ0hET0cpIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9B
UkNICj4gKyAgICAgICBkZXBlbmRzIG9uIERFQlVHX0tFUk5FTCAmJiAhUzM5MCAmJiAhSEFWRV9O
TUlfV0FUQ0hET0cKPiArICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9S
X1BFUkYgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZIHx8IEhBVkVfSEFSRExPQ0tV
UF9ERVRFQ1RPUl9BUkNICgpJZiB5b3UgYWRkIHRoZSAiIUhBVkVfTk1JX1dBVENIRE9HIiBhcyBh
IGRlcGVuZGVuY3kgdG8KSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZLCBhcyBkaXNjdXNz
ZWQgaW4gYSBwcmV2aW91cyBwYXRjaCwgeW91CmNhbiBza2lwIGFkZGluZyBpdCBoZXJlLgoKCj4g
ICAgICAgICBpbXBseSBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYKPiAgICAgICAgIGltcGx5IEhB
UkRMT0NLVVBfREVURUNUT1JfQlVERFkKPiAgICAgICAgIHNlbGVjdCBMT0NLVVBfREVURUNUT1IK
PiBAQCAtMTA3OSw3ICsxMDc3LDcgQEAgY29uZmlnIEhBUkRMT0NLVVBfREVURUNUT1JfUFJFRkVS
X0JVRERZCj4gICAgICAgICBib29sICJQcmVmZXIgdGhlIGJ1ZGR5IENQVSBoYXJkbG9ja3VwIGRl
dGVjdG9yIgo+ICAgICAgICAgZGVwZW5kcyBvbiBIQVJETE9DS1VQX0RFVEVDVE9SCj4gICAgICAg
ICBkZXBlbmRzIG9uIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGICYmIEhBVkVfSEFSRExP
Q0tVUF9ERVRFQ1RPUl9CVUREWQo+IC0gICAgICAgZGVwZW5kcyBvbiAhSEFWRV9OTUlfV0FUQ0hE
T0cKPiArICAgICAgIGRlcGVuZHMgb24gIUhBVkVfSEFSTE9DS1VQX0RFVEVDVE9SX0FSQ0gKCkRv
bid0IG5lZWQgdGhpcy4gQXJjaGl0ZWN0dXJlcyBuZXZlciBhcmUgYWxsb3dlZCB0byBkZWZpbmUK
SEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgYW5kIEhBVkVfSEFSTE9DS1VQX0RFVEVDVE9S
X0FSQ0gKCgo+ICAgICAgICAgZGVmYXVsdCBuCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFNh
eSBZIGhlcmUgdG8gcHJlZmVyIHRoZSBidWRkeSBoYXJkbG9ja3VwIGRldGVjdG9yIG92ZXIgdGhl
IHBlcmYgb25lLgo+IEBAIC0xMDk2LDcgKzEwOTQsNyBAQCBjb25maWcgSEFSRExPQ0tVUF9ERVRF
Q1RPUl9QRVJGCj4gICAgICAgICBib29sCj4gICAgICAgICBkZXBlbmRzIG9uIEhBUkRMT0NLVVBf
REVURUNUT1IKPiAgICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BF
UkYgJiYgIUhBUkRMT0NLVVBfREVURUNUT1JfUFJFRkVSX0JVRERZCj4gLSAgICAgICBkZXBlbmRz
IG9uICFIQVZFX05NSV9XQVRDSERPRwo+ICsgICAgICAgZGVwZW5kcyBvbiAhSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX0FSQ0gKClNpbWlsYXJseSwgZG9uJ3QgbmVlZCB0aGlzLgoKCj4gICAgICAg
ICBzZWxlY3QgSEFSRExPQ0tVUF9ERVRFQ1RPUl9DT1VOVFNfSFJUSU1FUgo+Cj4gIGNvbmZpZyBI
QVJETE9DS1VQX0RFVEVDVE9SX0JVRERZCj4gQEAgLTExMDQsNyArMTEwMiw3IEBAIGNvbmZpZyBI
QVJETE9DS1VQX0RFVEVDVE9SX0JVRERZCj4gICAgICAgICBkZXBlbmRzIG9uIEhBUkRMT0NLVVBf
REVURUNUT1IKPiAgICAgICAgIGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JV
RERZCj4gICAgICAgICBkZXBlbmRzIG9uICFIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiB8
fCBIQVJETE9DS1VQX0RFVEVDVE9SX1BSRUZFUl9CVUREWQo+IC0gICAgICAgZGVwZW5kcyBvbiAh
SEFWRV9OTUlfV0FUQ0hET0cKPiArICAgICAgIGRlcGVuZHMgb24gIUhBVkVfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9BUkNICgpTaW1pbGFybHksIGRvbid0IG5lZWQgdGhpcy4KCgpJbiBnZW5lcmFsIEkg
ZG9uJ3Qgb2JqZWN0IHRvIHNwbGl0dGluZyBvdXQgSEFWRV9OTUlfV0FUQ0hET0cgZnJvbQpIQVZF
X0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdy
ZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
