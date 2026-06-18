Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T1l+O74WNGrJOAYAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 18 Jun 2026 18:03:11 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D65276A16F6
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 18 Jun 2026 18:03:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=mr3iQWQi;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=AGcFkibL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=i21UzF3k;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=KzyxCqQf;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHmxe9p8YyGVPnFOdj0m24fhBaSvcKLK1sXpa39wzys=; b=mr3iQWQibfOHGIUtRsCtWeo+Vn
	HQn/+z9UQTlpExaG1I6fAnIGCCdxRl8H77gEX0osE1icqqTzcJHAkDLMRQxXx+9T8a/B7HYY7Ckod
	3sSlDCAJYq5q/pNxw9lJSfKEOGpLt1/bv7ntpvNytd+rk0WZiI3Fh7i/zkINEyclDqoo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1waFCo-0008Le-FH
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 18 Jun 2026 16:03:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1waFCn-0008LO-3C
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 18 Jun 2026 16:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6q+xa9pobUclcWWbIMsV6VOGDYzhvjgkb7rqkpkprHM=; b=AGcFkibLQnjagkCQuA4dFtC+aP
 MJdGg1qAFinzInWCo6dG/Ep4yPc1DVoyWytWmmPVqDViFEG1EHBVDqJkppi6CzJ/ZBWKVsZOEfzFi
 fREhoiQnIW9I9E2iPDqxzLshxqF+q7rcjfapQf1Uh5zJRwqcL+OUQ6QQbHRAbqf8cEPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6q+xa9pobUclcWWbIMsV6VOGDYzhvjgkb7rqkpkprHM=; b=i21UzF3kOxDMIJvMu+0EBCuvjE
 jwd2qne4wwqrSVrwueMKkULz75sSy3XenukS9Lm5Msx+8d8IgJnmLsEXcQCYsxPJKRfGWO7cDMg5d
 KcEzVCgyUzBlY3BN25I/winQ4vxUHpX0pM6XgWQFlJSrOyS5A4Xcai4xb1wl827Avp3s=;
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1waFCj-0006hz-Of for kgdb-bugreport@lists.sourceforge.net;
 Thu, 18 Jun 2026 16:03:01 +0000
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-963d7e5ffddso715089241.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 18 Jun 2026 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781798572; x=1782403372;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6q+xa9pobUclcWWbIMsV6VOGDYzhvjgkb7rqkpkprHM=;
 b=KzyxCqQfmG9ieEwgN89T9HvSnuMjHGz6qxvdAZMrliZJJDwI6zJA8ZEg+FdKa2sPhQ
 /yLRaTEKaf/6SoOmA5bxIXOJGurZxArtCzRVbZGzZy4OVvuOXpVvrgkD/cWgNx0xghqA
 +juy6Dn9Sc61WOTecHGbB+4lcSiBdYvODwpzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781798572; x=1782403372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6q+xa9pobUclcWWbIMsV6VOGDYzhvjgkb7rqkpkprHM=;
 b=T+M9qU68/ixtiMt/5PwohR4Nb82Qq3qg09DCdkMGYJ/ewZlcaJqWMhHqZDBboxzDHe
 AJFGvNsVF3ivjlWDgHCa/JT1MigIYVpoluGJJ0nM+uvLzUAWrySRz4tVHNmnI4hxGNq2
 yOlg9biAwLuT4E45tonKM5XeUm+N8+Dla5tRtXEvVoiUaeGlMrHPa7IcrSNguQPGymJa
 jzkTpdUnKRFUIPhKLvF810EmkilBBUEA/3+f840QQTxz7menNd2w5fjkWIFchCHTcFey
 TSfAzrkwIU6UYlNgWwQrFeUwGy304X8U3cTUGplq8ocNnx9b9ztWY+fNmI3zRp/JJkp5
 4sAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8HuTIOiB1BkKTe6CviSmEykky7stvhvlPHZdw3tJh+Yg9m9t4KQ1ETb+HWZqndSgkRSoK1C1db+dtLBuJ4sQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyJvBBGn5D2vPKPTstFeDZ7mL4zRdKVrX9X2b+LlwYVV3C6ABDK
 gLavOmqd69Fu1gnqRiVPzFgZJSIBP75UeWn5cYCQs/ybrU2Z+05UPSNuqoqwLUAFBrZRfIBZTHT
 JV3o=
X-Gm-Gg: AfdE7clM6lo8n7o6GGYcjVKheiSv9lhy2b9ANfSg6wy7dI596XbICNCoVNm3XvdCMDF
 miNNAo1YZIJ1aYOdODJJiFyT2BqhHASsgna2Sdp6EbDmcmSAHf6QrrJMnx9GaNp9e6A6z67KYLF
 Ph1j+uN4T4abO6bthJKtySgWkSo8xr7GSvm6bnONOcuC/p/aLC8o0SHDs0jwuU6ddi27TAoFCfI
 PauVJV7jsyjYWen4RFbL2f30jLFdVV+KAQ7ZF5geD6LezpD71fTPkdashejRqP3G/4Dzbdo8vSj
 jKPI//TtLw2LxlgwNkT8A1Ve42K6M+qFFOElntTKynIBTla80f0kcK3HhcM590E/37a7mUN2z5W
 guzoPezgMfpGtFAoZfDdiY+6/IaMPtgYylYEjV/FivkZBjqkiOSkZ7fHX/lyiQ/7mgwEafcRha0
 KaV18Ogy/m3rjM7JLdV2JOc27QL8+Bqk8iCHYwo04PPCZ/uJYNTuE=
X-Received: by 2002:a05:6102:50a5:b0:71b:e02f:65e2 with SMTP id
 ada2fe7eead31-72a040b483dmr156288137.20.1781798572106; 
 Thu, 18 Jun 2026 09:02:52 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-720878872efsm9919801137.12.2026.06.18.09.02.50
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 09:02:50 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-7270d55d19dso684800137.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 18 Jun 2026 09:02:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9VC1gXH09Kgy7X1aVN0thA2R/0PyklpPAUCFx4+yQ0bxjc2Aoy9cgfFyrlRaCR4SAJ4I53RznsWo9eLIgaEw==@lists.sourceforge.net
X-Received: by 2002:a05:6102:2c85:b0:729:a7d8:e56d with SMTP id
 ada2fe7eead31-72a048e24f6mr187650137.27.1781798569435; Thu, 18 Jun 2026
 09:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=X4+AH5yprKR2kysg4A7uy5vHfidK_Z0AZ2z28y-k2wgw@mail.gmail.com>
 <l6b6bomrw3bvkehlv73fyghk6loz6jpdwqk5c4nthnhl7j7kzk@4jjhfpzv5zon>
 <CAD=FV=UH5BmRTX+SgyJRft6ZXgbK2hQmXofb_KyVTXtOfW9BQQ@mail.gmail.com>
 <20260618110447.61911245@pumpkin>
In-Reply-To: <20260618110447.61911245@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jun 2026 09:02:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsbhjtVMOh9h=MUrnm6MJzzoGhV4jKcrc=x_oWes3KPg@mail.gmail.com>
X-Gm-Features: AVVi8CefLzdpKBPeMwnSFGjJxWvdDFKKAlHrehIfC_vp9hf-FkVPfUVgNtJAtMY
Message-ID: <CAD=FV=VsbhjtVMOh9h=MUrnm6MJzzoGhV4jKcrc=x_oWes3KPg@mail.gmail.com>
To: David Laight <david.laight.linux@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Jun 18,
 2026 at 3:04 AM David Laight <david.laight.linux@gmail.com>
 wrote: > > > > @@ -783, 8 +783, 6 @@ static int kdb_exec_defcmd(int argc, const
 char **argv) > > > > > > /* Command history */ [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.45 listed in wl.mailspike.net]
X-Headers-End: 1waFCj-0006hz-Of
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: unify CMD_BUFLEN definition
 into kdb_private.h
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:naveen.osdev@gmail.com,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:davidlaightlinux@gmail.com,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	RSPAMD_URIBL_FAIL(0.00)[lists.sourceforge.net:query timed out];
	FREEMAIL_CC(0.00)[lists.sourceforge.net,gmail.com,kernel.org,vger.kernel.org,windriver.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,chromium.org:s=google];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,chromium.org:-];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D65276A16F6

SGksCgpPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCAzOjA04oCvQU0gRGF2aWQgTGFpZ2h0CjxkYXZp
ZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gPiBAQCAtNzgzLDggKzc4Myw2
IEBAIHN0YXRpYyBpbnQga2RiX2V4ZWNfZGVmY21kKGludCBhcmdjLCBjb25zdCBjaGFyICoqYXJn
dikKPiA+ID4KPiA+ID4gIC8qIENvbW1hbmQgaGlzdG9yeSAqLwo+ID4gPiAgI2RlZmluZSBLREJf
Q01EX0hJU1RPUllfQ09VTlQgIDMyCj4gPiA+IC0jZGVmaW5lIENNRF9CVUZMRU4gICAgICAgICAg
ICAgMjAwICAgICAvKiBrZGJfcHJpbnRmOiBtYXggcHJpbnRsaW5lCj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBzaXplID09IDI1NiAqLwo+ID4KPiA+IE1h
eWJlIERhbmllbCB3aWxsIGtub3cgbW9yZTsgb3RoZXJ3aXNlLCBJIG5lZWQgdG8gc3BlbmQgbW9y
ZSB0aW1lCj4gPiBkaWdnaW5nLiAuLi5idXQgdGhlIGNvbW1lbnQgYWJvdmUgKHRoYXQgeW91J3Jl
IGRlbGV0aW5nKSBtYWtlcyBtZQo+ID4gYmVsaWV2ZSB0aGF0IDIwMCB3YXMgcHVycG9zZWx5IGNo
b3NlbiB0byBiZSBhIG51bWJlciB0aGF0IHdhcyB1bmRlcgo+ID4gMjU2LiBJdCBzb3VuZHMgYXMg
aWYgbWF5YmUgdGhleSdyZSBrZWVwaW5nIHNvbWUgYnVmZmVycyBhdCAyMDAgc28gdGhhdAo+ID4g
dGhlcmUnZSBlbm91Z2ggZXh0cmEgc3BhY2UgdG8gcHJpbnQgdGhlIGJ1ZmZlciBwbHVzIHNvbWUg
ZXh0cmEgc3R1ZmY/Cj4gPgo+ID4gTWF5YmUgc2FmZXIgdG8ga2VlcCB0aGUgbnVtYmVyIGF0IDIw
MD8KPgo+IEkgYmV0IHRoZSBwcm9tcHQrY29tbWFuZCBoYXMgdG8gZml0IGluIDI1NiBieXRlcz8K
PiBXaG8gd2FudHMgYSBwcm9tcHQgdGhhdCBpcyBtb3JlIHRoYW4gKGFib3V0KSAyMCBjaGFyYWN0
ZXJzIGFueXdheT8KCkFzIEkgc2FpZCwgSSdtIG5vdCByZWFsbHkgc3VyZSB0aGVyZSdzIHZhbHVl
IGluIG1lc3Npbmcgd2l0aCB0aGUga2RiCnByb21wdCB0byBiZWdpbiB3aXRoLCBzaW5jZSB0aGVy
ZSdzIG5vIHVzZWZ1bCBpbmZvIHlvdSBjYW4gcHV0IGluIGl0Cm90aGVyIHRoYW4gdGhlIENQVS4g
Li4uYnV0IHdoYXRldmVyLgoKCj4gRldJVyB0aGVyZSBhcmUgYSBmZXcgb3RoZXIgdmVyeSBzdHJh
bmdlIHN0cmNweSgpIGluIGtkYmcgdGhhdCBJJ20gcHJldHR5Cj4gc3VyZSBjYW4gYWN0dWFsbHkg
b3ZlcndyaXRlIHRoZSBlbmQgb2YgdGhlIGJ1ZmZlci4KPiAoT25lcyB0aGF0IHB1dCBhIHNwZWNp
YWwgbWFya2VyIHN0cmluZyAoSUlSQyAia2RiZyIpIGludG8gYSBidWZmZXIuKQoKV2UndmUgaGFk
IHNldmVyYWwgcm91bmRzIG9mIHBhdGNoZXMgaW1wcm92aW5nIHN0cmluZyBzYWZldHkuIElmIHlv
dQpjYW4gc2hvdyBhbnkgbWlzc2VkIGNhc2VzLCBwbGVhc2Ugc2VuZCBhIHBhdGNoLiBJbiB0aGlz
IGRheSBhbmQgYWdlLAppZiB0aGVyZSBhcmUgcHJvYmxlbXMsIGl0J3MgcHJvYmFibHkgYSBtYXR0
ZXIgb2YgdGltZSBiZWZvcmUgQUkgc2VuZHMKdXMgcGF0Y2hlcy4gSSBwcmVzdW1lIE5hdmVlbiBl
bmRlZCB1cCBoZXJlIHRvIGJlZ2luIHdpdGggYmVjYXVzZSBBSQpwb2ludGVkIG91dCB0aGUgcHJv
YmxlbXMgdGhhdCBoZSdzIGZpeGluZy4KCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
