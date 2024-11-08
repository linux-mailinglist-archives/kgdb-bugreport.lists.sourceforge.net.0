Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9B9C1371
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 02:09:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9DVL-000129-Bc
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 01:09:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t9DVE-00011v-Tx
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=; b=WisOwavlTKwe4HCDkE6F32tuoa
 ezhHlf9cvShA1x5he5Bwqu+x5Ozvm4kxBwMnMXngwo7fo6JcM65xd0qfr2pLukllm1wocs4ytwNnY
 HSlhdLB1oCLs1yTd1P8z9T7NO1rmH8IMvM8Pum8BMucyVtlATxrevrhwU+mNbkDfUwL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=; b=YhHyDXLp2ZoUC6NiCKvMFP0XHa
 PM+56YpnMEhrrWBVLPYQNNJTNUmaPtFT4O4n+2ZMpG024kLioZNBnuQ6FZlQ0vJsr7otKiOKFeL7l
 x8wJYwrpd2IIN7/snQGxd8NNeIgtPPe+iOTpe46vmcDppKtKrdFAQDPwYJVYAl8TwSdo=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9DVB-00052D-0V for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:09:29 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso23778871fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 Nov 2024 17:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731028155; x=1731632955;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=;
 b=f179c9Z6EVX62Fn1BC9Khc8o9jYKqt74tWlra4PzeXwINafft70WDTNEOoWZFz9Jty
 NrFdvby6Wm5kiZJkjcPIAmPllYwO/0BAAuOtY00FyGU/70DWGSuTO4j6kWC+Ne3KgaXq
 HBsKQGRDCK05QlOv9Q8fHq4KYC+Xsy6VZFsaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731028155; x=1731632955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=;
 b=rhhvwqNJ2BHGaIQnEzEmlLpNH9yCZSSfYnRa1P8XXQW6SC8giumtpYiVeaJJxMoabW
 zK+SGkGgA/TL1znuz3XZNkGm/eBlX2gqag0KOiEJM8wHjYMQgoG/2dP6bIJV+GVid5kv
 Mu8h20j1grXsssL3aWNuDLEKl98//KxlmFaykHcxsRMp7o9srrfgDCw9IKRiMxi4Msjn
 Z70a1L8VjLckv0Gol/uRLfZHvlMwQXug2mp8CcrTtF0fDUbsisMfAkCR3xyve4uwexJc
 abzwWAQvQA5+L8eHI2Fn+AUaYi8KDfOMVi+XgAZnghur3cJRCH8fOCVlEQVQrvmNDYaV
 3zcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6AKX6pIfhM7oNTaiF2gm6QAOQP7U4lMIm9rn73Kd6TBZQH8SyRCMywpzkwajJg2f6dUCUleRCc6qBbn9oug==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3Xpca8vIwK7b/rnKaRm/hknVsla779GTZy2soV0U3KXJWpeLO
 XH+RrrNfHpN3YHuGIEcQQqkEY1WU1MI4ZwzI6pHbrNWSicplQsMIHPfg0+TdhvxLOCOnQrWtFwG
 0Kg==
X-Google-Smtp-Source: AGHT+IEJ/HAAdT0DycFcYm01AxkaqSbM3TgqEq+VGqVOAsxVYS8vESIUVBtFaOZTWl1GotQ7YnTGkQ==
X-Received: by 2002:a2e:bd05:0:b0:2fb:3960:9671 with SMTP id
 38308e7fff4ca-2ff201ba32fmr7444941fa.15.1731028155379; 
 Thu, 07 Nov 2024 17:09:15 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178dfa5bsm4343991fa.18.2024.11.07.17.09.14
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 17:09:14 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso23778201fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 Nov 2024 17:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHRWB9d+P0HvGRrPGyGBDbiEw4wJtjTYXnxcVgTVQBHDQeEPNB8xRZnX+c8w7/8kQLpjtbiiKTWUuuEcgvMQ==@lists.sourceforge.net
X-Received: by 2002:a05:651c:b2b:b0:2fb:3960:9667 with SMTP id
 38308e7fff4ca-2ff2018a7e6mr7981491fa.14.1731028153615; Thu, 07 Nov 2024
 17:09:13 -0800 (PST)
MIME-Version: 1.0
References: <Zy093jVKPs9gSVx2@telecaster>
In-Reply-To: <Zy093jVKPs9gSVx2@telecaster>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Nov 2024 17:08:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
Message-ID: <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
To: Omar Sandoval <osandov@osandov.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Nov 7, 2024 at 2:23 PM Omar Sandoval <osandov@osandov.com>
    wrote: > > Hi everyone, > > Amal is working on adding a custom query packet
    to kgdb for getting the > kernel's vmcoreinfo. The rati [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.170 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9DVB-00052D-0V
Subject: Re: [Kgdb-bugreport] kgdb replacing newline with CRLF in custom
 query response
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Stephen Brennan <stephen.s.brennan@oracle.com>, Amal Raj T <amalrajt@meta.com>,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE5vdiA3LCAyMDI0IGF0IDI6MjPigK9QTSBPbWFyIFNhbmRvdmFsIDxvc2Fu
ZG92QG9zYW5kb3YuY29tPiB3cm90ZToKPgo+IEhpIGV2ZXJ5b25lLAo+Cj4gQW1hbCBpcyB3b3Jr
aW5nIG9uIGFkZGluZyBhIGN1c3RvbSBxdWVyeSBwYWNrZXQgdG8ga2dkYiBmb3IgZ2V0dGluZyB0
aGUKPiBrZXJuZWwncyB2bWNvcmVpbmZvLiBUaGUgcmF0aW9uYWxlIGFuZCBkZXRhaWxzIGFyZSBh
dmFpbGFibGUgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vb3NhbmRvdi9kcmduL3dpa2kvR0RC
LVJlbW90ZS1Qcm90b2NvbC1wcm9wb3NhbDotbGludXgudm1jb3JlaW5mby1xdWVyeS1wYWNrZXQK
Pgo+IHZtY29yZWluZm8gaXMgYWJvdXQgM2tCLCBzbyB3ZSB3ZXJlIGhvcGluZyB0byBhdm9pZCBo
ZXgtZW5jb2RpbmcgdGhlCj4gcmVzcG9uc2UgYW5kIGRvdWJsaW5nIHRoZSB0aW1lIGl0IHRha2Vz
IHRvIHRyYW5zbWl0IG92ZXIgYSBzbG93IHNlcmlhbAo+IGNvbm5lY3Rpb24uIEluc3RlYWQsIHdl
IHdlcmUgaG9waW5nIHRvIHVzZSB0aGUgZXNjYXBlZCBiaW5hcnkgZm9ybWF0LAo+IHdoaWNoIGVz
Y2FwZXMgdGhlIGNoYXJhY3RlcnMgIyR9KiBhbmQgbGVhdmVzIG90aGVyIGJ5dGVzIHVudG91Y2hl
ZC4KPgo+IFdlIHJhbiBpbnRvIGEgcHJvYmxlbSwgdGhvdWdoOiB2bWNvcmVpbmZvIGNvbnRhaW5z
IG5ld2xpbmUgY2hhcmFjdGVycywKPiB3aGljaCB0aGUgc2VyaWFsIGNvcmUgcmVwbGFjZXMgd2l0
aCBDUkxGOyBzZWUgY29tbWl0IGM3ZDQ0YTAyYWM2MAo+ICgic2VyaWFsX2NvcmU6IENvbW1vbmFs
aXplIGNybGYgd2hlbiB3b3JraW5nIHcvIGEgbm9uIG9wZW4gY29uc29sZQo+IHBvcnQiKS4KCkZX
SVcsIHRoZSBwcm9ibGVtIHByZWRhdGVzIHRoYXQgY29tbWl0LCBidXQgdGhhdCBjb21taXQgYXQg
bGVhc3QgbW92ZWQKaXQgdG8gYmUgc29tZXBsYWNlIGNvbW1vbi4gQmVmb3JlIHRoYXQgc29tZSBz
ZXJpYWwgZHJpdmVycyB3ZXJlCmhhcmRjb2RpbmcgaXQuLi4gOy0pCgoKPiBUaGlzIGVmZmVjdGl2
ZWx5IGNvcnJ1cHRzIHRoZSBkYXRhIGFuZCBjYXVzZXMgYSBjaGVja3N1bQo+IG1pc21hdGNoLgo+
Cj4gV2UnZCBsb3ZlIHNvbWUgaW5wdXQgb24gaG93IHRvIHdvcmsgYXJvdW5kIHRoaXMsIGVzcGVj
aWFsbHkgZnJvbSB0aGUKPiBrZ2RiIG1haW50YWluZXJzLiBIZXJlIGFyZSBhIGZldyBvcHRpb25z
LCBpbiBkZXNjZW5kaW5nIG9yZGVyIG9mIG15Cj4gcHJlZmVyZW5jZToKPgo+IDEuIERpc2FibGUg
dGhlIExGIC0+IENSTEYgcmVwbGFjZW1lbnQgd2hpbGUgc2VuZGluZyBiaW5hcnkgZGF0YS4KPiAy
LiBFc2NhcGUgdGhlIG5ld2xpbmVzIHVzaW5nIHNvbWUgb3RoZXIgY3VzdG9tIHNjaGVtZS4KPiAz
LiBHaXZlIHVwIGFuZCBoZXgtZW5jb2RlIHRoZSByZXNwb25zZS4KCkkgaGF2ZW4ndCB0cmllZCBw
cm90b3R5cGluZyBpdCwgYnV0IHdoYXQgYWJvdXQgbW92aW5nIHRoZSBMUiAtPiBDUkxGCmNvZGUg
dG8ga2RiX21zZ193cml0ZSgpLiBJdCB3b3VsZCBiZSByZWFsbHkgZWFzeSB0byBkbyB0aGlzIGlu
IHRoZQpjYXNlIHdoZXJlIHdlJ3JlIGRvaW5nICJkYmdfaW9fb3BzLT53cml0ZV9jaGFyKCkiIHNp
bmNlIHdlJ3JlIGFscmVhZHkKcHJvY2Vzc2luZyBjaGFyYWN0ZXIgYXQgYSB0aW1lLiBJdCB3b3Vs
ZCBiZSBoYXJkZXIgdG8gZG8gdGhpcyB3aGVuCmFsc28gc2VuZGluZyB0aGUgb3V0cHV0IHRvIHRo
ZSB2YXJpb3VzIGNvbnNvbGUsIGJ1dCBtYXkgbm90IF90b29fCmhhcmQ/IFlvdSBjb3VsZCBsb29w
IHNlYXJjaGluZyBmb3IgIlxuIiBhbmQgc2VuZCBhbGwgdGhlIGNoYXJhY3RlcnMKYmVmb3JlIHRo
ZSAiXG4iLCB0aGVuIHNlbmQgYSAiXHIiLCB0aGVuIHNlbmQgdGhlICJcbiIgYW5kIGFsbCB0aGUK
Y2hhcmFjdGVycyB1cCB0byB0aGUgbmV4dCAiXG4iLgoKSWYgeW91IGRpZCB0aGlzIHRoZW4geW91
J2QgbG9zZSB0aGUgIlxuIiB0byAiXHJcbiIgY29tYmluYXRpb24gaW4gdGhlCmdkYiBzdHViLCBi
dXQgX3Byb2JhYmx5XyB0aGF0IGRvZXNuJ3QgbWF0dGVyPwoKLURvdWcKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5n
IGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
