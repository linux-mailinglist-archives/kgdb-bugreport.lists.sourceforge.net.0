Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C79ABAD72C6
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 12 Jun 2025 15:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqQj0hLnz5vqv3b+S2qRb4TO79rM1Fwn4GYBIkEq6pg=; b=Ld8CwIbTpBLM8tOkz48ovgG4fF
	aA+nkKKBYZj/qlpd9zoZLnsdZumKHG0CH/e/QijImG/ExMSykRrtIcwluf1YukZ3yQwM3ORtoCJbb
	g4nfz1eSzvL+nU8+x/REZIy72Hc7YWLg6iWEbS0f2TT3O5KtE/diL1rBkbza/F3wWXpg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uPiQp-0007aa-M9
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 12 Jun 2025 13:57:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uPiQo-0007aT-GL
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 13:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uWIybPnFMO+iPTF1D7X2vHTnG4Ra9zFxBSdBlVwLzyQ=; b=W14oxqSKdVXFFKZEkN+L3uvERz
 2qeVXSuvc+1KPBmiQuvr5gKEcESzyd6zx5+n94dLGEXeTN0ZPAmcP7sqFPD1662mZnllOHUIXDUjk
 p7YyF/DL5bD3ozjXoXDt56TeU+ADZkKRYwntCmcJvnOKLyDQlYA7lTZk57D+rSdMBC6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uWIybPnFMO+iPTF1D7X2vHTnG4Ra9zFxBSdBlVwLzyQ=; b=DQKQ0ZnRUIWTmyQB/hznEn8tk2
 szs0PBfniTS1I9ZAu2GFhv5vQpeLWfRcOni/n88l2ykK4oIgnJHdkf+uW+C0xnuo0L/QT8GPimYue
 cN7Uwkyyy43ywr/6YO7qotq+3oQ7sR8Ueg9xuvWM8hqpf3xgrVjHMqR3UbeXDK2nEWqw=;
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPiQn-0002tH-Vi for kgdb-bugreport@lists.sourceforge.net;
 Thu, 12 Jun 2025 13:57:26 +0000
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so7498995e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 12 Jun 2025 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1749736639; x=1750341439; darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uWIybPnFMO+iPTF1D7X2vHTnG4Ra9zFxBSdBlVwLzyQ=;
 b=OByQdCNzt1kFSLxQLMPedlE+Sl1v4GQlsziqWgCqxSQZS6I2KJyQfq60GHo2lZ6GUN
 euXjPULhAlOhCHf62rtmvdJv8XB+bxSRiYrfnR4Yf7wBXXkzm5uMuV336DL+NzNQgr1o
 VHIs00UTzvpRJCvY0cyWwm8YMg0xO8u1brRU3HPzGhiwJ5NX6emIRVdsLYPXTxExqgJi
 8jwmSP/ukkmcRF6N3Pb7MMS8Oe+RGXX4YFGEXYDZh8GcgZDTKml7TKg0RA67NPlJDj9S
 j9Vk/PKLcJ6fuYncAkSFejHnFCbeYMAloXqsUjMl3NPVgUHVFYS4XG3jbKDW6DEZ5RVL
 d7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749736639; x=1750341439;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWIybPnFMO+iPTF1D7X2vHTnG4Ra9zFxBSdBlVwLzyQ=;
 b=I3EG9qiBkr1g1RE3omWkuwzTees6fakWfmcdYOctdZ+/4rLLB6xvPQd7TDKfyrkrY/
 G05Oy3PRGq3RVLe8IsKFL5aWlQ8hlAadvxrVQWnvejUwECXcvqCvNYASaOitT3vwMNoF
 htWpDitC7kkV1BBowTOdnD+PNmOaOj3AekYH+RErKR3FxXaszHWrDWvxBwE2N2sU6eqO
 QXo1dLvroq1SdJpqSIcjwNI6TcuDMXSgMhlzogg/X3Dz2jvMXyr637lNQDV+r3UOReuY
 RLmUD8BvFYO/eTKqJm8C3tSlBfDv85RZjxDyafDnMkrDEzSa313fQoDQKXaCBC6zeeB6
 wkpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKWLhilcu9qIbVt21QWE/gg1v6UAI/p9x1fSgWfEecYT1Yy6z9rK6t+Mqk4afF7xA8kVMHroGc2eRsYGgCfA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz1h2lbrH+g/t5DFOC+mnomOjqGNz4thz/muUePPh7xxYMjxKpW
 CoNqcRY0mFiGtlE61yxaSyc3/MjPjCpC3b6M4evuBc4k3bz6BqYR/fXf/Ecqmt/rwKD8+bzhiR8
 fNgzV
X-Gm-Gg: ASbGncu2xd9+ZtrUI+ZahgFLTuraWAkQnHA7e5Ncoqx7z5bOSLrfNCJLVEjnbR4HZwW
 xwJjlNBBaKKYn1nQIS3aqzGAeB4gARx3OuKxD8vMNG9i3pjjVS+wQ/WMtnWUpsBfwNZdhfmri+U
 OHaVioKHIhA98ZqnI09boT/QGyNy7wip5MeESPnLBOLdFoIf54wmxNEgaST7JvDU6H+djRUzsnS
 9GGYTjAN3IF/mK4jcMkrRNIwT36q8ClctXpeqgvgw/Eq7TG45GcduUmTm6UBl4SDSa3RUp/vAi/
 OQioUzfsIkc0onDZS4zXyLj56puo3Hc9pWo1hoikk1MIyoXVjviSVPQ5sHhq3do/
X-Google-Smtp-Source: AGHT+IHHTgsF4plb+4cSFCswnZ1BoRaKntWrXC3dKLfejS0J5Ju71cHUfrXuDzUBs/xWMfkadhCSvw==
X-Received: by 2002:a05:6000:420b:b0:3a5:52b3:103b with SMTP id
 ffacd0b85a97d-3a5586dce0bmr5309298f8f.4.1749736639382; 
 Thu, 12 Jun 2025 06:57:19 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e61b65esm14131675ad.12.2025.06.12.06.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 06:57:18 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:57:00 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <aErcrCKcsi9cpANY@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
 <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
 <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XFeokpbMUFjAc0OkwJ97vR8aB+4GbnFxRKymvpEY3gnA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-06-10 16:18:22, Doug Anderson wrote: > Hi, > >
 On Tue, Jun 10, 2025 at 1:03 PM Marcos Paulo de Souza > <mpdesouza@suse.com>
 wrote: > > > > On Mon, 2025-06-09 at 13:13 -0700, Doug Anderson [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.49 listed in wl.mailspike.net]
X-Headers-End: 1uPiQn-0002tH-Vi
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] drivers: serial: kgdboc: Check
 CON_SUSPENDED instead of CON_ENABLED
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVHVlIDIwMjUtMDYtMTAgMTY6MTg6MjIsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMTowM+KAr1BNIE1hcmNvcyBQYXVsbyBkZSBTb3V6
YQo+IDxtcGRlc291emFAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgMjAyNS0wNi0w
OSBhdCAxMzoxMyAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gSGksCj4gPiA+Cj4g
PiA+IE9uIEZyaSwgSnVuIDYsIDIwMjUgYXQgNzo1NOKAr1BNIE1hcmNvcyBQYXVsbyBkZSBTb3V6
YQo+ID4gPiA8bXBkZXNvdXphQHN1c2UuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEFsbCBj
b25zb2xlcyBmb3VuZCBvbiBmb3JfZWFjaF9jb25zb2xlIGFyZSByZWdpc3RlcmVkLCBtZWFuaW5n
IHRoYXQKPiA+ID4gPiBhbGwgb2YKPiA+ID4gPiB0aGVtIGFyZSBDT05fRU5BQkxFRC4gVGhlIGNv
ZGUgdHJpZXMgdG8gZmluZCBhbiBhY3RpdmUgY29uc29sZSwgc28KPiA+ID4gPiBjaGVjayBpZiB0
aGUKPiA+ID4gPiBjb25zb2xlIGlzIG5vdCBzdXNwZW5kZWQgaW5zdGVhZC4KPiA+ID4gPgo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2Uu
Y29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMgfCAz
ICsrLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJv
Yy5jCj4gPiA+ID4gYi9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMKPiA+ID4gPiBpbmRleAo+
ID4gPiA+IDg1ZjZjNWE3NmUwZmZmNTU2Zjg2ZjBkNDVlYmM1YWFkZjViMTkxZTguLmFmNmQyMjA4
YjhkZGI4MmQ2MmYzMzI5MmIKPiA+ID4gPiAwMDZiMjkyMzU4M2EwZDIgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy90
dHkvc2VyaWFsL2tnZGJvYy5jCj4gPiA+ID4gQEAgLTU3Nyw3ICs1NzcsOCBAQCBzdGF0aWMgaW50
IF9faW5pdCBrZ2Rib2NfZWFybHljb25faW5pdChjaGFyCj4gPiA+ID4gKm9wdCkKPiA+ID4gPiAg
ICAgICAgIGNvbnNvbGVfbGlzdF9sb2NrKCk7Cj4gPiA+ID4gICAgICAgICBmb3JfZWFjaF9jb25z
b2xlKGNvbikgewo+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAoY29uLT53cml0ZSAmJiBjb24t
PnJlYWQgJiYKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgIChjb24tPmZsYWdzICYgKENPTl9C
T09UIHwgQ09OX0VOQUJMRUQpKSAmJgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgKGNvbi0+
ZmxhZ3MgJiBDT05fQk9PVCkgJiYKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICgoY29uLT5m
bGFncyAmIENPTl9TVVNQRU5ERUQpID09IDApICYmCj4gPiA+Cj4gPiA+IEkgaGF2ZW4ndCB0cmll
ZCBydW5uaW5nIHRoZSBjb2RlLCBzbyBJIGNvdWxkIGVhc2lseSBiZSBtaXN0YWtlbiwKPiA+ID4g
YnV0Li4uCj4gPiA+Cj4gPiA+IC4uLnRoZSBhYm92ZSBkb2Vzbid0IHNlZW0gbGlrZSB0aGUgY29y
cmVjdCBjb252ZXJzaW9uLiBUaGUgb2xkCj4gPiA+IGV4cHJlc3Npb24gd2FzOgo+ID4gPgo+ID4g
PiAoY29uLT5mbGFncyAmIChDT05fQk9PVCB8IENPTl9FTkFCTEVEKSkKPiA+ID4KPiA+ID4gVGhh
dCB3b3VsZCBldmFsdWF0ZSB0byBub24temVybyAodHJ1ZSkgaWYgdGhlIGNvbnNvbGUgd2FzIF9l
aXRoZXJfCj4gPiA+ICJib290IiBvciAiZW5hYmxlZCIuCj4gPiA+Cj4gPiA+IFRoZSBuZXcgZXhw
cmVzc2lvbiBpcyBpczoKPiA+ID4KPiA+ID4gKGNvbi0+ZmxhZ3MgJiBDT05fQk9PVCkgJiYgKChj
b24tPmZsYWdzICYgQ09OX1NVU1BFTkRFRCkgPT0gMCkKPiA+ID4KPiA+ID4gVGhhdCdzIG9ubHkg
dHJ1ZSBpZiB0aGUgY29uc29sZSBpcyBfYm90aF8gImJvb3QiIGFuZCAibm90IHN1c3BlbmRlZCIu
Cj4gPgo+ID4gTXkgaWRlYSBoZXJlIHdhcyB0aGF0IHRoZSB1c2VycyBvZiBmb3JfZWFjaF9jb25z
b2xlIHdvdWxkIGZpbmQgdGhlCj4gPiBmaXJzdCBhdmFpbGFibGUgY29uc29sZSwgYW5kIGJ5IGF2
YWlsYWJsZSBJIHdvdWxkIGV4cGVjdCB0aGVtIHRvIGJlCj4gPiB1c2FibGUuIEluIHRoaXMgY2Fz
ZSwgaXMgdGhlcmUgYW55IHZhbHVlIGZvciBrZ2Rib2MgdG8gdXNlIGEgY29uc29sZQo+ID4gdGhh
dCBpcyBzdXNwZW5kZWQ/IFdvdWxkIGl0IHdvcmsgaW4gdGhpcyBjYXNlPwo+ID4KPiA+IEkgbmV2
ZXIgcmVhbGx5IHVzZWQga2dkYm9jLCBidXQgb25seSBjaGVja2luZyBpZiB0aGUgY29uc29sZSB3
YXMKPiA+IGVuYWJsZWQgKHdoaWNoIGl0J3MgYWx3YXlzIHRoZSBjYXNlIGhlcmUpIHdhcyBzb21l
dGhpbmcgdGhhdCBuZWVkZWQgdG8KPiA+IGJlIGZpeGVkLgo+ID4KPiA+IE1heWJlIEknbSBtaXNz
aW5nIHNvbWV0aGluZyBoZXJlIGFzIHdlbGwsIHNvIHBsZWFzZSBsZXQgbWUga25vdyBpZiBJCj4g
PiBzaG91bGQgcmVtb3ZlIHRoZSBuZXcgY2hlY2suCj4gCj4gU28gaXQncyBiZWVuIDUgeWVhcnMg
c2luY2UgSSB3cm90ZSB0aGUgY29kZSwgYnV0IHJlYWRpbmcgdGhhdCBJIHdhcwo+IGNoZWNraW5n
IGZvcjoKPiAKPiAgIChjb24tPmZsYWdzICYgKENPTl9CT09UIHwgQ09OX0VOQUJMRUQpKQo+IAo+
IE1ha2VzIG1lIGJlbGlldmUgdGhhdCB0aGlzIHdhcyB0aGUgY2FzZSB3aGVuIEkgd3JvdGUgdGhl
IGNvZGU6Cj4gMS4gRWFybHkgYm9vdCBjb25zb2xlcyAoZWFybHljb24pIHdlcmUgbm90IG1hcmtl
ZCBhcyBDT05fRU5BQkxFRCBidXQKPiB3ZXJlIGluc3RlYWQgbWFya2VkIGFzIENPTl9CT09ULgo+
IDIuIE9uY2UgY29uc29sZXMgYmVjYW1lIG5vbi1lYXJseSB0aGV5IHdlcmUgbW92ZWQgdG8gQ09O
X0VOQUJMRUQuCj4gCj4gLi4uYW5kIHRoZSBjb2RlIHdhcyBiYXNpY2FsbHkgbG9va2luZyBmb3Ig
YW55IGNvbnNvbGVzIHdpdGggYSBtYXRjaGluZwo+IG5hbWUgdGhhdCB3ZXJlIGVpdGhlciBib290
IGNvbnNvbGVzIG9yIG5vcm1hbC9lbmFibGVkIGNvbnNvbGVzLgo+IAo+IElzIHRoYXQgYSBwbGF1
c2libGUgdGhlb3J5PyBJdCdzIGFsc28gcG9zc2libGUgdGhhdCBJIGp1c3Qgd2FzCj4gY29uZnVz
ZWQgd2hlbiBJIGNvZGUgdGhpbmdzIHVwIGFuZCB0aGF0IEkgcmVhbGx5IG1lYW50IHRvIHdyaXRl
OgoKSXQgaXMgZWFzeSB0byBnZXQgY29uZnVzZWQgYnkgdGhlIHJlZ2lzdGVyX2NvbnNvbGUoKSBj
b2RlLiBBbmQKaXQgaGFzIGJlZW4gZXZlbiB3b3JzZSBzb21lIHllYXJzIGFnby4KCkFueXdheSwg
dGhlIGN1cnJlbnQgY29kZSBzZXRzIENPTl9FTkFCTEVEIGZvciBhbGwgcmVnaXN0ZXJlZApjb25z
b2xlcywgaW5jbHVkaW5nIENPTl9CT09UIGNvbnNvbGVzLiBUaGUgZmxhZyBpcyBjbGVhcmVkIG9u
bHkKYnkgY29uc29sZV9zdXNwZW5kKClbKl0gb3IgdW5yZWdpc3Rlcl9jb25zb2xlKCkuCgpJTUhP
LCBrZ2Rib2NfZWFybHljb25faW5pdCgpIGRvZXMgbm90IG5lZWQgdG8gY2FyZSBhYm91dApjb25z
b2xlX3N1c3BlbmQoKSBiZWNhdXNlIHRoZSBrZXJuZWwgY291bGQgbm90IGJlIHN1c3BlbmRlZApk
dXJpbmcgYm9vdC4gRG9lcyB0aGlzIG1ha2VzIHNlbnNlPwoKQWxzbyBpdCBkb2VzIG5vdCBuZWVk
IHRvIGNhcmUgYWJvdXQgdW5yZWdpc3Rlcl9jb25zb2xlKCkgYmVjYXVzZQp0aGUgdW5yZWdpc3Rl
cmVkIGNvbnNvbGUgd29uJ3QgYmUgbGlzdGVkIGJ5IGZvcl9lYWNoX2NvbnNvbGUoKS4KClsqXSBU
aGUgMXN0IHBhdGNoIGluIHRoaXMgcGF0Y2hzZXQgdXBkYXRlcyBjb25zb2xlX3N1c3BlbmQoKQog
ICAgdG8gc2V0IENPTl9TVVNQRU5ERUQgaW5zdGVhZCBvZiBjbGVhcmluZyBDT05fRU5BQkxFRC4K
ICAgIEl0IGhlbHBzIHRvIG1ha2UgaXQgY2xlYXIgdGhhdCBpdCBpcyBzdXNwZW5kLXJlbGF0ZWQu
CgoKUmVzdW1lOgoKSSB3b3VsZCByZW1vdmUgdGhlIGNoZWNrIG9mIENPTl9FTkFCTEVEIG9yIENP
Tl9TVVNQRU5ERUQKZnJvbSBrZ2Rib2NfZWFybHljb25faW5pdCgpIGNvbXBsZXRlbHkuCgpJTUhP
LCB3ZSBzaG91bGQga2VlcCB0aGUgY2hlY2sgb2YgQ09OX0JPT1QgYmVjYXVzZSB3ZSBkbyBub3QK
d2FudCB0byByZWdpc3RlciAibm9ybWFsIiBjb25zb2xlIGRyaXZlcnMgYXMga2dkYm9jX2Vhcmx5
Y29uX2lvX29wcy4KSXQgaXMgbGF0ZXIgcmVtb3ZlZCBieSBrZ2Rib2NfZWFybHljb25fZGVpbml0
KCkuIEkgZ3Vlc3MKdGhhdCB0aGUgY29kZSBpcyBub3QgcmVhZHkgdG8gaGFuZGxlIGEgdGFrZW92
ZXIgZnJvbSBub3JtYWwKdG8gbm9ybWFsIChldmVuIHRoZSBzYW1lKSBjb25zb2xlIGRyaXZlci4K
ClRvIG1ha2UgaXQgY2xlYXIsIEkgd291bGQgdXNlOgoKCWZvcl9lYWNoX2NvbnNvbGUoY29uKSB7
CgkJaWYgKGNvbi0+d3JpdGUgJiYgY29uLT5yZWFkICYmCgkJICAgIChjb24tPmZsYWdzICYgQ09O
X0JPT1QpICYmCgkJICAgICghb3B0IHx8ICFvcHRbMF0gfHwgc3RyY21wKGNvbi0+bmFtZSwgb3B0
KSA9PSAwKSkKCQkJYnJlYWs7Cgl9CgpBbmQgSSB3b3VsZCBkbyB0aGlzIGNoYW5nZSBhcyB0aGUg
MXN0IHBhdGNoIGluIHRoZSBwYXRjaHNldApiZWZvcmUgd2UgY2hhbmdlIHRoZSBmbGFnIG1vZGlm
aWVkIGJ5IGNvbnNvbGVfc3VzcGVuZCgpLgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFp
bGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
