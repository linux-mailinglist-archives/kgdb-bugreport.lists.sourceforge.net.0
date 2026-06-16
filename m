Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9m7NIgbKMWqNqAUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:11:18 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0470695897
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:11:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=YQfKYHLD;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KF3TcIPU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="d1QA/NzP";
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b="G/q7aUwx";
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrExipXmalPT/dsU5o2ZX4jZtGdtnzimDJ7oqfRCR5A=; b=YQfKYHLDL1kI3pZTismbWez1/m
	xVjTq/OG+Ud7ZI9d2EdPWie0oJfrImT3h0k5pnrH0+nCViyo5eGJYI8y7ln8T3x9qb3rn4Hh5eanE
	5Cpy1V8fCi3oUCzVRwEvZT6HB3KKwBLoAyZ4/4cNJ3bxOr7P8G5WKm8racb+A5Q/phKk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZc04-0001pE-Gc
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Jun 2026 22:11:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1wZc03-0001p6-Nt
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wJR5OaqXvdD9v9MlsblqCA5/10opJB/BO8fqSMEFnTc=; b=KF3TcIPUlw2jvc64n8MDd4ZwxO
 Au8xKgHQdsFmVP0gGACAgdzbvl74Yu1dklu9ir5WjNKV7BPUwaI0zWdtjLIZkRl48sqWp/rIGkS24
 rhjIWv7PuYPdoClbYelppXdz+KdW/AYS5A+F0S/NzfOVUsv7x8MZ/cHqk5IOuCbYyp/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wJR5OaqXvdD9v9MlsblqCA5/10opJB/BO8fqSMEFnTc=; b=d1QA/NzPAp4LrSrjDq6EqyiWPo
 01oNibCbnBw1cq/NMRGiyFQZ53GCm7NkUk1cpAAZIX/32z/uiuaqq4hTCnn4drYjVF08J55biEIwU
 bqWxkUnF/zDSVv1kAezsHEg6dAjQlp1ThZlZbhl7rYO9Z36hy/Xi+g184h5cAn1mP9/s=;
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZc01-0000FD-SQ for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:11:15 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-440df1c768bso3254027fac.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 15:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781647864; x=1782252664;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJR5OaqXvdD9v9MlsblqCA5/10opJB/BO8fqSMEFnTc=;
 b=G/q7aUwxW9yd48eHdn+TBLgiT9piuRI3btEGhBgK/jk466Qrw+hw9dYb9iSzfzHZPi
 FCgqrM2c9FkhsNdLjE5C8M12zOZ4IpA74rA4vMkLWYLipSb8U6O4c+GfdW9R70/o4l2u
 1RNJnPB21wIBoL0bI021+MF/9uiC6n3MfEaEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781647864; x=1782252664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wJR5OaqXvdD9v9MlsblqCA5/10opJB/BO8fqSMEFnTc=;
 b=f7++0vZIgpEJiz2jDu0XUDFZFIwq0O8r4E50D0NXf2tc++DSitGa8gOm7mHQqBxz5P
 7Zgme2mZgfSdQEqBlkFEc+IpGczO3GnK8JC+G+PD21u+AjsQTjOcvp+AKF3eLUrrzw34
 YzrBU54nqSMrBeIFIj8bWZU9c5OhzQUik+HwJPPSRmnJXlZ+1DXE8Cy4za/phcq+nzlI
 soGoa1kzgDddBT9/4rbZf5g4EqGDlNQHTIfyRYLAe3N3or9llLwyKib8LMzvKIRhA26+
 4qrDxXyvJMOzvpOynz9XcTku3lt1QppfIpRu9xpWhXNFODQDrtWjE9fF0hh9t2vCAkEX
 zYjA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+fiq2n6qP0vBgCoP9qYBWiS4HP2gqM06fyWxaSUH271rB8sGtDjNrVcDDyCeeEtDeYiemU9IetJRMmv3piFA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx/ssfZU+tdoSu/klY9KZxWZimoqbsGk6+QB+7PcbdP/Y87AWEG
 qVKzC4F/MQ5pTohCtTSHprI3kJ3GI308+s8zTGUuLIy4u3hMELOebQ5YjD7DMPSwQ5pQaDvjvUI
 GrWY=
X-Gm-Gg: Acq92OHSKGk4WpNccfkL4dRM8nCj1ltCmygTgcOIqYs5j1VjUrqMEqJt9kbdpVCCKIw
 RHdkJJYZW9AFFczAwqItQtlkDYkHo+E+0OtdKfmCXDT/cTG5WgvObZ05fIhCT9uBq1xkCe7dd+j
 SUkYt0lOL/hOaegjels0sRJ6zLP9Z4kyIGadRm/RSgb5RGrbPv1l7LlhqHJF59PDkay9mbWzt0o
 t6yS50XvWcQxphsoL/WdNA0HRQTemb+4roff9DCOUp0viuEru/coP0jliVPG1Ja1vr6SJxvEsz4
 KRrWzC7GvOHsaCXdUa5vNi0QfRCT3dz+6FHBxnDcbaYac/GIRQxi3voieIzTptUCJDip0g18sj+
 Vq/LWn5slVuqszW/WRlJHh+HMGynbKbopd+YMWh9/OOK1RsGkSwby6Pcj1wQ4i0rYxfYlcX8aLU
 B6nZbrmuNm7Rbh/V5FTYAzb3Hy5bYLzE9wt0ILafmgCHd2mrnOgpoXXHlqjTGrNw==
X-Received: by 2002:a05:6102:1626:b0:6ef:d9b8:88d with SMTP id
 ada2fe7eead31-7245da77f28mr735727137.8.1781646360683; 
 Tue, 16 Jun 2026 14:46:00 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-966c5b6389asm2061662241.13.2026.06.16.14.45.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 14:45:59 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-6c3154fa47fso3816713137.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 14:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9bLnDmVAeMjSNyZHznhvW6RlqpMR8ZVRJi1WLwQsyAykDYRWJFlM1QpaF7aS0F06/j8cNg2L8NObSTPgBv7Q==@lists.sourceforge.net
X-Received: by 2002:a05:6102:d89:b0:660:c9e5:8d95 with SMTP id
 ada2fe7eead31-7245da97910mr766290137.12.1781646358893; Tue, 16 Jun 2026
 14:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <6wupyv7bhyicbko5wjqsfgcj7xdu2bun7cglq75pencg5os4b5@7lu2pwgzcrrj>
In-Reply-To: <6wupyv7bhyicbko5wjqsfgcj7xdu2bun7cglq75pencg5os4b5@7lu2pwgzcrrj>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Jun 2026 14:45:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoX2WmXpbpDAUDaO-H=TweXjAuP4Z5QZMQ1YqWZropnA@mail.gmail.com>
X-Gm-Features: AVVi8CeVcR6AlVRx5W8CxdZVONS_gUOXCNqlCif79DYkYyjg3VAhQNZpeOrAOgw
Message-ID: <CAD=FV=VoX2WmXpbpDAUDaO-H=TweXjAuP4Z5QZMQ1YqWZropnA@mail.gmail.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 16, 2026 at 9:42 AM Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com> wrote: > > When kdb_setenv() fails to find a free
 slot in __env[], the function > returns KDB_ENVFULL without freeing th [...]
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wZc01-0000FD-SQ
Subject: Re: [Kgdb-bugreport] [PATCH] db: fix memory leak in kdb_setenv()
 when environment is full
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
Cc: kgdb-bugreport@lists.sourceforge.net, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:naveen.osdev@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,chromium.org:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,chromium.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:from_mime,chromium.org:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0470695897

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCA5OjQy4oCvQU0gTmF2ZWVuIEt1bWFyIENoYXVk
aGFyeQo8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGtkYl9zZXRlbnYo
KSBmYWlscyB0byBmaW5kIGEgZnJlZSBzbG90IGluIF9fZW52W10sIHRoZSBmdW5jdGlvbgo+IHJl
dHVybnMgS0RCX0VOVkZVTEwgd2l0aG91dCBmcmVlaW5nIHRoZSBwcmV2aW91c2x5IGFsbG9jYXRl
ZCBzdHJpbmcKPiBidWZmZXIgJ2VwJywgbGVha2luZyBtZW1vcnkgb24gZXZlcnkgZmFpbGVkIGNh
bGwuCj4KPiBBZGQgdGhlIG1pc3Npbmcga2ZyZWUoZXApIGJlZm9yZSByZXR1cm5pbmcgS0RCX0VO
VkZVTEwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gS3VtYXIgQ2hhdWRoYXJ5IDxuYXZlZW4u
b3NkZXZAZ21haWwuY29tPgo+IC0tLQo+ICBrZXJuZWwvZGVidWcva2RiL2tkYl9tYWluLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpXaXRoIHRoZSBleGNlcHRpb24g
b2YgdGhlIG1pc3NpbmcgJ2snIGF0IHRoZSBzdGFydCBvZiB0aGUgc3ViamVjdApsaW5lLCB0aGlz
IGxvb2tzIGdvb2QgdG8gbWUuIFByZXN1bWFibHkgaXQgc2hvdWxkIGhhdmUgYSAiRml4ZXM6IiBs
aW5lCnRvbzoKCkZpeGVzOiBhMzBkNGZmODE5M2UgKCJrZGI6IHJlbW92ZSB1c2FnZSBvZiBzdGF0
aWMgZW52aXJvbm1lbnQgYnVmZmVyIikKCkFzaWRlIGZyb20gdGhhdDoKClJldmlld2VkLWJ5OiBE
b3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
