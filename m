Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aDhYHykVM2oP9QUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 23:44:09 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E72E69C8E1
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 23:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=crEbPQmW;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=hjwzQaAm;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="V+Peho/T";
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=TbpGU7zj;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPxmVhfiFbNBAJp4uXrgiyStlysA2AUKeCtfbqi5uKA=; b=crEbPQmWNkWnvghV1PxsZZy/PO
	4Y3XOCHBnW4+69J9YZLnYUpt5P/C5eorJirU0bldrDBxlvDSlHlALkv0NDrJeWKRz4jZ3JcPFjtTv
	oVCo+tTmTbBC3aOrlyt7Xist7t0ewBinJZ0thP8uottFVLT324YhR2aa2dRARuWjaSBQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZy3J-0003fE-Nr
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Jun 2026 21:44:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1wZy3I-0003f7-2H
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Jun 2026 21:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RSF+AThxDvX/BFG1c4kpe6M8qAI5dFlN45t0aJGtyMM=; b=hjwzQaAmVO8bvRhUE7gyc3ugY3
 FSVXb1d+4NbKBHxOZCCIPylfgnoQ8NTrRyqAZm4coQGyT1Ak8pmuhcQBGpLc6uy8F+nooJapo34mM
 Wt5qPZLEm35yIDetmBogosS/UnyUsnhhUlWAHkGnZ1D78wwGwW8uxSNDbcrr48+wSOOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RSF+AThxDvX/BFG1c4kpe6M8qAI5dFlN45t0aJGtyMM=; b=V+Peho/TtrzFjCjgisuTa8VHtk
 5MqoqYIqr+Bf819EGc6qg62kFT352a8cE2kntMtf9plONSm41bnOge5HU/Yos90nFatX9MZpd3OZx
 N1PxUla0EFktD0XWTDeNCfkj38Rx3RicvXRE9EOYNNfQV3cl7qBxAlkvvStg7Y86YQqM=;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZy3F-0000R7-O9 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Jun 2026 21:44:04 +0000
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-486560db81cso164829b6e.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Jun 2026 14:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781732631; x=1782337431;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSF+AThxDvX/BFG1c4kpe6M8qAI5dFlN45t0aJGtyMM=;
 b=TbpGU7zjF+E1MhjFl81WqQVVX/Q71IX1f0O25tmIosQ8wap3NbeKQl1Llgez711O6k
 /msH7EbcEQEfeRwTj182CfQw32TYT8DYVqmPFjgvBiV7zgTcMX6q17YHOMuynuN9z+/w
 B52brXMg6kqLaJgFggpWojY+8ifBdlEZdyURg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781732631; x=1782337431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RSF+AThxDvX/BFG1c4kpe6M8qAI5dFlN45t0aJGtyMM=;
 b=V3C7pmsjO4iRfU0Qa8xwpNlFQsT+GCuRNwoyQR8y/2DOHxOfUrv0V2kvOdgSVcKYvp
 MfunnzDP9qf6id6OaAMpdPUwBjRu9moQByWAHxNDjjlRpBKKcKj1XzBDR+VF2vpQE+c0
 3yDcQBkHIBX5uyA2Wc4Tw6RgLCnjv9pSoHq/FFCXk3n2d1ngrWAl4MIOLHVsZh5vsX71
 ZUiQLUD4fFqio7iyXolEoY59sfGwF5kUGzVM2tcWVrEdcETmkf6q1bGGyhFdsMDLwVn6
 CeISov55BQ/aXBMvDCOdr9sCzo+Fjyu5lTA5OgDnozKDZna3pcRYQgtrWp6CWAXZ6lIj
 6XVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9t8qfC/YZT5elS7bDldGvfbUO++akx+GP+zqtL6+ivSFsO4luzcbnVy0UKjNxfhC0TxOLSk2q66uJxNE8WQg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxlqZTHR76cc55ItaUSD/kj9p2iJtcKC3WoXcpS5CB/tde5lquL
 8YnOe25gvARLEOdzo88FF177TZBsi+FGE+oFAynhpwuH1z2vQwI423RaxNJozEfJoaZrnRmJoGG
 7vfg=
X-Gm-Gg: Acq92OFLAO3UqpmWVS/6dMvTzMw97XB3ueMz0uhso4A+g5hqxBE+oeUPjLnUY51QeTx
 MVQOIxGAiKM798HaCmr1c+0U4lxp3YkkwXMt1HyU+ysC7L6B5kfEA+63kyBaqxFTQXzTTBnA/pu
 YpnAPOvskLt0LpGE8GI/rWBqldc+vIZQxl94NkYjHYvmBaBYnNJJP9th+28mqSFxbmmdVvhhHho
 It3BtzYuJDOifxztZ/G4BDd41jo0jIlkN3+i8DBQzIv/MNyJOEGyANMefPhfyIAavpgfTCMnTgd
 xlVxv4sDNP5r6TlV+giO3CwG9pPRTyiFq1t0XWPR/yaYk7Hj6lKZhCgL6xVa4YHewmPduvsHm1u
 lqxfoesOCW7XZE4QKN7hk44AE8ohAt5tiVKZPxVrtO2FHPIgLt2BnBaZi7rvRKk/x1lF3zoWVah
 ESgnHQb8LnRQmUpOFQeZ+q6zUv+XNtw5uUK/+M5nhvaTOqvZLAhTQ=
X-Received: by 2002:a05:6122:8b16:b0:59f:4c56:9d0e with SMTP id
 71dfb90a1353d-5bbbe5d0d94mr3507473e0c.5.1781731014891; 
 Wed, 17 Jun 2026 14:16:54 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5bbcb7b3674sm1642488e0c.9.2026.06.17.14.16.53
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 14:16:53 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-6cfdce656bfso105078137.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Jun 2026 14:16:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+I/b8ogyltKmsRaNCt+ln078XtgDDlQCAX98g/On9T7fiJ72SJNQtmwVYDFynQLSrdm705voJEN6luVYVWkg==@lists.sourceforge.net
X-Received: by 2002:a05:6102:4bcd:b0:722:a46b:2f2c with SMTP id
 ada2fe7eead31-7246c9abeaemr3477384137.15.1781731012885; Wed, 17 Jun 2026
 14:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=X4+AH5yprKR2kysg4A7uy5vHfidK_Z0AZ2z28y-k2wgw@mail.gmail.com>
 <l6b6bomrw3bvkehlv73fyghk6loz6jpdwqk5c4nthnhl7j7kzk@4jjhfpzv5zon>
In-Reply-To: <l6b6bomrw3bvkehlv73fyghk6loz6jpdwqk5c4nthnhl7j7kzk@4jjhfpzv5zon>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jun 2026 14:16:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UH5BmRTX+SgyJRft6ZXgbK2hQmXofb_KyVTXtOfW9BQQ@mail.gmail.com>
X-Gm-Features: AVVi8CdGA8sMhAMQKD5QYzqUN1gHTESnuy_ff9_tjVwU3RnOYaW_CQOqMxFaUdM
Message-ID: <CAD=FV=UH5BmRTX+SgyJRft6ZXgbK2hQmXofb_KyVTXtOfW9BQQ@mail.gmail.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 16, 2026 at 7:28 PM Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com> wrote: > > CMD_BUFLEN was defined separately in
 kdb_io.c (256) and kdb_main.c > (200), causing kdb_main.c to use the wro [...]
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.177 listed in wl.mailspike.net]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wZy3F-0000R7-O9
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
Cc: kgdb-bugreport@lists.sourceforge.net, david.laight.linux@gmail.com,
 danielt@kernel.org, linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:naveen.osdev@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:david.laight.linux@gmail.com,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:naveenosdev@gmail.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E72E69C8E1

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCA3OjI44oCvUE0gTmF2ZWVuIEt1bWFyIENoYXVk
aGFyeQo8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDTURfQlVGTEVOIHdhcyBk
ZWZpbmVkIHNlcGFyYXRlbHkgaW4ga2RiX2lvLmMgKDI1NikgYW5kIGtkYl9tYWluLmMKPiAoMjAw
KSwgY2F1c2luZyBrZGJfbWFpbi5jIHRvIHVzZSB0aGUgd3Jvbmcgc2l6ZSB3aGVuIGZvcm1hdHRp
bmcgdGhlCj4gcHJvbXB0IHN0cmluZyBpbnRvIGtkYl9wcm9tcHRfc3RyICh3aGljaCBpcyAyNTYg
Ynl0ZXMpLgo+Cj4gTW92ZSBDTURfQlVGTEVOICgyNTYpIGludG8ga2RiX3ByaXZhdGUuaCBzbyBh
bGwgdXNlcnMgc2hhcmUgYSBzaW5nbGUKPiBjb25zaXN0ZW50IGRlZmluaXRpb24sIGFuZCByZW1v
dmUgdGhlIGxvY2FsIGRlZmluaXRpb25zIGZyb20gYm90aAo+IGZpbGVzLgo+Cj4gRml4ZXM6IDVk
NTMxNGQ2Nzk1ZiAoImtkYjogY29yZSBmb3Iga2dkYiBiYWNrIGVuZCAoMSBvZiAyKSIpCj4gU2ln
bmVkLW9mZi1ieTogTmF2ZWVuIEt1bWFyIENoYXVkaGFyeSA8bmF2ZWVuLm9zZGV2QGdtYWlsLmNv
bT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYyAgICAgIHwgMSAtCj4gIGtlcm5l
bC9kZWJ1Zy9rZGIva2RiX21haW4uYyAgICB8IDYgKystLS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIv
a2RiX3ByaXZhdGUuaCB8IDMgKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lv
LmMgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4gaW5kZXggYzM5OWYxMTc0MGVmLi5mNWIx
YjdkNGM5YzggMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYwo+ICsrKyBi
L2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKPiBAQCAtMjIsNyArMjIsNiBAQAo+ICAjaW5jbHVk
ZSA8bGludXgva2FsbHN5bXMuaD4KPiAgI2luY2x1ZGUgImtkYl9wcml2YXRlLmgiCj4KPiAtI2Rl
ZmluZSBDTURfQlVGTEVOIDI1Ngo+ICBjaGFyIGtkYl9wcm9tcHRfc3RyW0NNRF9CVUZMRU5dOwo+
Cj4gIGludCBrZGJfdHJhcF9wcmludGs7Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9rZGIv
a2RiX21haW4uYyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYwo+IGluZGV4IGRkY2U1NmI0
N2IyNS4uY2EwMTI2ZGI5ODUwIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21h
aW4uYwo+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYwo+IEBAIC03ODMsOCArNzgz
LDYgQEAgc3RhdGljIGludCBrZGJfZXhlY19kZWZjbWQoaW50IGFyZ2MsIGNvbnN0IGNoYXIgKiph
cmd2KQo+Cj4gIC8qIENvbW1hbmQgaGlzdG9yeSAqLwo+ICAjZGVmaW5lIEtEQl9DTURfSElTVE9S
WV9DT1VOVCAgMzIKPiAtI2RlZmluZSBDTURfQlVGTEVOICAgICAgICAgICAgIDIwMCAgICAgLyog
a2RiX3ByaW50ZjogbWF4IHByaW50bGluZQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKiBzaXplID09IDI1NiAqLwoKTWF5YmUgRGFuaWVsIHdpbGwga25vdyBtb3Jl
OyBvdGhlcndpc2UsIEkgbmVlZCB0byBzcGVuZCBtb3JlIHRpbWUKZGlnZ2luZy4gLi4uYnV0IHRo
ZSBjb21tZW50IGFib3ZlICh0aGF0IHlvdSdyZSBkZWxldGluZykgbWFrZXMgbWUKYmVsaWV2ZSB0
aGF0IDIwMCB3YXMgcHVycG9zZWx5IGNob3NlbiB0byBiZSBhIG51bWJlciB0aGF0IHdhcyB1bmRl
cgoyNTYuIEl0IHNvdW5kcyBhcyBpZiBtYXliZSB0aGV5J3JlIGtlZXBpbmcgc29tZSBidWZmZXJz
IGF0IDIwMCBzbyB0aGF0CnRoZXJlJ2UgZW5vdWdoIGV4dHJhIHNwYWNlIHRvIHByaW50IHRoZSBi
dWZmZXIgcGx1cyBzb21lIGV4dHJhIHN0dWZmPwoKTWF5YmUgc2FmZXIgdG8ga2VlcCB0aGUgbnVt
YmVyIGF0IDIwMD8KCgo+ICBzdGF0aWMgdW5zaWduZWQgaW50IGNtZF9oZWFkLCBjbWRfdGFpbDsK
PiAgc3RhdGljIHVuc2lnbmVkIGludCBjbWRwdHI7Cj4gIHN0YXRpYyBjaGFyIGNtZF9oaXN0W0tE
Ql9DTURfSElTVE9SWV9DT1VOVF1bQ01EX0JVRkxFTl07Cj4gQEAgLTEyNjUsOCArMTI2Myw4IEBA
IHN0YXRpYyBpbnQga2RiX2xvY2FsKGtkYl9yZWFzb25fdCByZWFzb24sIGludCBlcnJvciwgc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MsCj4KPiAgZG9fZnVsbF9nZXRzdHI6Cj4gICAgICAgICAgICAgICAg
IC8qIFBST01QVCBjYW4gb25seSBiZSBzZXQgaWYgd2UgaGF2ZSBNRU1fUkVBRCBwZXJtaXNzaW9u
LiAqLwo+IC0gICAgICAgICAgICAgICBzbnByaW50ZihrZGJfcHJvbXB0X3N0ciwgQ01EX0JVRkxF
Tiwga2RiZ2V0ZW52KCJQUk9NUFQiKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgcmF3X3Nt
cF9wcm9jZXNzb3JfaWQoKSk7Cj4gKyAgICAgICAgICAgICAgIHNucHJpbnRmKGtkYl9wcm9tcHRf
c3RyLCBDTURfQlVGTEVOLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBrZGJnZXRlbnYoIlBS
T01QVCIpLCByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpKTsKClVucmVsYXRlZCB3aGl0ZXNwYWNlIGNo
YW5nZS4gRHJvcCBmcm9tIHlvdXIgcGF0Y2guCgoKPiAgICAgICAgICAgICAgICAgLyoKPiAgICAg
ICAgICAgICAgICAgICogRmV0Y2ggY29tbWFuZCBmcm9tIGtleWJvYXJkCj4gZGlmZiAtLWdpdCBh
L2tlcm5lbC9kZWJ1Zy9rZGIva2RiX3ByaXZhdGUuaCBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX3By
aXZhdGUuaAo+IGluZGV4IDkyYTI4YjhhYjYwNC4uNzIyZThhYTUwNzI0IDEwMDY0NAo+IC0tLSBh
L2tlcm5lbC9kZWJ1Zy9rZGIva2RiX3ByaXZhdGUuaAo+ICsrKyBiL2tlcm5lbC9kZWJ1Zy9rZGIv
a2RiX3ByaXZhdGUuaAo+IEBAIC0yMjUsNyArMjI1LDggQEAgZXh0ZXJuIHZvaWQga2RiX2tiZF9j
bGVhbnVwX3N0YXRlKHZvaWQpOwo+ICAjZGVmaW5lIGtkYl9rYmRfY2xlYW51cF9zdGF0ZSgpCj4g
ICNlbmRpZiAvKiAhIENPTkZJR19LREJfS0VZQk9BUkQgKi8KPgo+IC1leHRlcm4gY2hhciBrZGJf
cHJvbXB0X3N0cltdOwo+ICsjZGVmaW5lIENNRF9CVUZMRU4gMjU2Cj4gK2V4dGVybiBjaGFyIGtk
Yl9wcm9tcHRfc3RyW0NNRF9CVUZMRU5dOwoKTm93IHRoYXQgdGhpcyBpcyBpbiBhIGhlYWRlciBm
aWxlLCBhIHNsaWdodGx5IGxlc3MgZ2VuZXJpYyBuYW1lIHdvdWxkCmJlIGdvb2QuIE1heWJlIHJl
bmFtZSB0byBLREJfQlVGTEVOIgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8va2dkYi1idWdyZXBvcnQK
