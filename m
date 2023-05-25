Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73445711AB4
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 May 2023 01:33:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2KSa-0007pD-Do
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 25 May 2023 23:33:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2KSY-0007p7-Uh
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 25 May 2023 23:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3YzCxsRkWRgjvxa97wKSZh7dXjwpqx38ke3QcUo28Gw=; b=fYIDosSTy8sGDBMd4RmsLCN6jE
 n9A1D46IvZQ1d1IcnOFfUeoy5cvq+HVu3986l8yCkPvF2mn5I+XobucP/cKflW+oG04ylGOaQzVB8
 WH3+MCZL1psRLhFUWb7HUb0LOvkepUlRfVzdw4W9zKvrLq/1eI/lj0Mj8kQ0clTuJpec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3YzCxsRkWRgjvxa97wKSZh7dXjwpqx38ke3QcUo28Gw=; b=MR6b5gDkHB6vp72aknp7i8+ZUs
 BHG7bHOIbrzD+mvYrq86HoNKUH9RuFdp7j39adb0zd+sIeGXIbDqhQKXNK8iAkSIqyOFoQkoX9fm9
 frlrCKr5D2YdI1lq1m933Uj2YMXc0LLFrpVSP3MjAm1G7Jb8hZvCs8ZSLHnpBHxgEX/Q=;
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2KSY-002gTU-Up for kgdb-bugreport@lists.sourceforge.net;
 Thu, 25 May 2023 23:33:31 +0000
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-774942ddfe0so22492539f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 May 2023 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685057603; x=1687649603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YzCxsRkWRgjvxa97wKSZh7dXjwpqx38ke3QcUo28Gw=;
 b=VcmegNiyrHr45qbI6LjbkKqsDJmFTnClgj4BsSM3Uuv6NfgYI+vf3TrkYnjmM4UPFs
 u3WntNEZCqZ+WQUpdu550/RyfJVasqwMOVRidRNGOqac7MeCBf4tnKXZaXr6nFqxNcXE
 BCe68xcgSqrteqzyovOtBpSTC3k4VqoqJk0sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057603; x=1687649603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YzCxsRkWRgjvxa97wKSZh7dXjwpqx38ke3QcUo28Gw=;
 b=Ks3OQnoytNXsCHkpaqgo9wK/pyXMzFTxgQ6LXoWzaxZt80rI2t3hlw6sLiXsxt6E0d
 g/4zWlt6BNYYvLDFq+JsMQz77OcBIeisubp4JMMRPEXHK2ehDe0fty3s0wd6+f6kBAM2
 qm9vIQbTLqJOVofcDMPMjtKpY3cqOUN0v+qSDKNPCcavlXRCMZkjK2u6cLCvKXDbv3a4
 bWFaWnw4xkWHHDR8wfOm6mTfZ21uNUjwwwZ0VJQwWd9U3zMUo6KCt9NaJWGt2vltfaki
 Kma5KDBsZBGoo9QMCPCk1SxeNdwWo7pGdVQvETUQPUw5ZHPiJLjTlumvi98BnWtFhO36
 Z0lQ==
X-Gm-Message-State: AC+VfDxVs6VnYa3nDK7oIloy1rP2yATEGqE7wKTIt27wRJGD7mQkkN5C
 AkKdaXNpR99GyWgYtr9ZDgM2qX6MwCdBOt+2HdQ=
X-Google-Smtp-Source: ACHHUZ4z2PmZ8O5wv5XopXHqwAEdZugDFI/p0/vwuMDxrvt70NPJCDRTeykbgWGhMKYrV5n1HDWzDg==
X-Received: by 2002:a05:6602:2158:b0:753:ca30:6bb0 with SMTP id
 y24-20020a056602215800b00753ca306bb0mr959538ioy.4.1685057603345; 
 Thu, 25 May 2023 16:33:23 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181]) by smtp.gmail.com with ESMTPSA id
 d20-20020a6b6814000000b0076c569c7a48sm269370ioc.39.2023.05.25.16.33.20
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 16:33:21 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-33828a86ee2so61025ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 May 2023 16:33:20 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c84:b0:331:a582:1c63 with SMTP id
 w4-20020a056e021c8400b00331a5821c63mr3274ill.3.1685057600304; Thu, 25 May
 2023 16:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
 <ZG4TW--j-DdSsUO6@alley>
In-Reply-To: <ZG4TW--j-DdSsUO6@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 May 2023 16:33:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu4BSec-kDxf8oS+DDcb+3W6RS-Z-Ouu-+sRnk2zhSrQ@mail.gmail.com>
Message-ID: <CAD=FV=Vu4BSec-kDxf8oS+DDcb+3W6RS-Z-Ouu-+sRnk2zhSrQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, May 24, 2023 at 6:38 AM Petr Mladek <pmladek@suse.com>
    wrote: > > On Fri 2023-05-19 10:18:36, Douglas Anderson wrote: > > Do a search
    and replace of: > > - NMI_WATCHDOG_ENABLED => WATCHDOG_H [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.49 listed in wl.mailspike.net]
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
X-Headers-End: 1q2KSY-002gTU-Up
Subject: Re: [Kgdb-bugreport] [PATCH v5 12/18] watchdog/hardlockup: Rename
 some "NMI watchdog" constants/function
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
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSAyNCwgMjAyMyBhdCA2OjM44oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpIDIwMjMtMDUtMTkgMTA6MTg6MzYsIERvdWds
YXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBEbyBhIHNlYXJjaCBhbmQgcmVwbGFjZSBvZjoKPiA+IC0g
Tk1JX1dBVENIRE9HX0VOQUJMRUQgPT4gV0FUQ0hET0dfSEFSRExPQ0tVUF9FTkFCTEVECj4gPiAt
IFNPRlRfV0FUQ0hET0dfRU5BQkxFRCA9PiBXQVRDSERPR19TT0ZUT0NLVVBfRU5BQkxFRAo+ID4g
LSB3YXRjaGRvZ19ubWlfID0+IHdhdGNoZG9nX2hhcmRsb2NrdXBfCj4gPiAtIG5taV93YXRjaGRv
Z19hdmFpbGFibGUgPT4gd2F0Y2hkb2dfaGFyZGxvY2t1cF9hdmFpbGFibGUKPiA+IC0gbm1pX3dh
dGNoZG9nX3VzZXJfZW5hYmxlZCA9PiB3YXRjaGRvZ19oYXJkbG9ja3VwX3VzZXJfZW5hYmxlZAo+
ID4gLSBzb2Z0X3dhdGNoZG9nX3VzZXJfZW5hYmxlZCA9PiB3YXRjaGRvZ19zb2Z0bG9ja3VwX3Vz
ZXJfZW5hYmxlZAo+ID4gLSBOTUlfV0FUQ0hET0dfREVGQVVMVCA9PiBXQVRDSERPR19IQVJETE9D
S1VQX0RFRkFVTFQKPiA+Cj4gPiBUaGVuIHVwZGF0ZSBhIGZldyBjb21tZW50cyBuZWFyIHdoZXJl
IG5hbWVzIHdlcmUgY2hhbmdlZC4KPiA+Cj4gPiBUaGlzIGlzIHNwZWNpZmljYWxseSB0byBtYWtl
IGl0IGxlc3MgY29uZnVzaW5nIHdoZW4gd2Ugd2FudCB0bwo+ID4gaW50cm9kdWNlIHRoZSBidWRk
eSBoYXJkbG9ja3VwIGRldGVjdG9yLCB3aGljaCBpc24ndCB1c2luZyBOTUlzLiBBcwo+ID4gcGFy
dCBvZiB0aGlzLCB3ZSBzYW5pdGl6ZWQgYSBmZXcgbmFtZXMgZm9yIGNvbnNpc3RlbmN5Lgo+ID4K
PiA+IC0tLSBhL2tlcm5lbC93YXRjaGRvZy5jCj4gPiArKysgYi9rZXJuZWwvd2F0Y2hkb2cuYwo+
ID4gQEAgLTMwLDE3ICszMCwxNyBAQAo+ID4gIHN0YXRpYyBERUZJTkVfTVVURVgod2F0Y2hkb2df
bXV0ZXgpOwo+ID4KPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUikg
fHwgZGVmaW5lZChDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cpCj4gPiAtIyBkZWZpbmUgTk1JX1dB
VENIRE9HX0RFRkFVTFQgICAgICAgIDEKPiA+ICsjIGRlZmluZSBXQVRDSERPR19IQVJETE9DS1VQ
X0RFRkFVTFQgMQo+ID4gICNlbHNlCj4gPiAtIyBkZWZpbmUgTk1JX1dBVENIRE9HX0RFRkFVTFQg
ICAgICAgIDAKPiA+ICsjIGRlZmluZSBXQVRDSERPR19IQVJETE9DS1VQX0RFRkFVTFQgMAo+ID4g
ICNlbmRpZgo+ID4KPiA+ICB1bnNpZ25lZCBsb25nIF9fcmVhZF9tb3N0bHkgd2F0Y2hkb2dfZW5h
YmxlZDsKPiA+ICBpbnQgX19yZWFkX21vc3RseSB3YXRjaGRvZ191c2VyX2VuYWJsZWQgPSAxOwo+
ID4gLWludCBfX3JlYWRfbW9zdGx5IG5taV93YXRjaGRvZ191c2VyX2VuYWJsZWQgPSBOTUlfV0FU
Q0hET0dfREVGQVVMVDsKPiA+IC1pbnQgX19yZWFkX21vc3RseSBzb2Z0X3dhdGNoZG9nX3VzZXJf
ZW5hYmxlZCA9IDE7Cj4gPiAraW50IF9fcmVhZF9tb3N0bHkgd2F0Y2hkb2dfaGFyZGxvY2t1cF91
c2VyX2VuYWJsZWQgPSBXQVRDSERPR19IQVJETE9DS1VQX0RFRkFVTFQ7Cj4gPiAraW50IF9fcmVh
ZF9tb3N0bHkgd2F0Y2hkb2dfc29mdGxvY2t1cF91c2VyX2VuYWJsZWQgPSAxOwo+Cj4gSSBzdGls
bCBzZWUgbm1pX3dhdGNoZG9nX3VzZXJfZW5hYmxlZCBhbmQgc29mdF93YXRjaGRvZ191c2VyX2Vu
YWJsZWQKPiBpbiBpbmNsdWRlL2xpbnV4L25taS5oLiBUaGV5IGFyZSBkZWNsYXJlZCB0aGVyZSBh
bmQgYWxzbyBtZW50aW9uZWQKPiBpbiBhIGNvbW1lbnQuCj4KPiBJdCBzZWVtcyB0aGF0IHRoZXkg
ZG8gbm90IGFjdHVhbGx5IG5lZWQgdG8gYmUgZGVjbGFyZWQgdGhlcmUuCj4gSSBndWVzcyB0aGF0
IGl0IHdhcyBuZWVkIGZvciB0aGUgL3Byb2Mgc3R1ZmYuIEJ1dCBpdCB3YXMKPiBtb3ZlZCBpbnRv
IGtlcm5lbC93YXRjaGRvZy5jIGJ5IHRoZSBjb21taXQgY29tbWl0IGRkMDY5M2ZkZjA1NGYyZWQz
Nwo+ICgid2F0Y2hkb2c6IG1vdmUgd2F0Y2hkb2cgc3lzY3RsIGludGVyZmFjZSB0byB3YXRjaGRv
Zy5jIikuCj4KPiA+ICBpbnQgX19yZWFkX21vc3RseSB3YXRjaGRvZ190aHJlc2ggPSAxMDsKPiA+
IC1zdGF0aWMgaW50IF9fcmVhZF9tb3N0bHkgbm1pX3dhdGNoZG9nX2F2YWlsYWJsZTsKPiA+ICtz
dGF0aWMgaW50IF9fcmVhZF9tb3N0bHkgd2F0Y2hkb2dfaGFyZGxvY2t1cF9hdmFpbGFibGU7Cj4g
Pgo+ID4gIHN0cnVjdCBjcHVtYXNrIHdhdGNoZG9nX2NwdW1hc2sgX19yZWFkX21vc3RseTsKPiA+
ICB1bnNpZ25lZCBsb25nICp3YXRjaGRvZ19jcHVtYXNrX2JpdHMgPSBjcHVtYXNrX2JpdHMoJndh
dGNoZG9nX2NwdW1hc2spOwo+Cj4gT3RoZXJ3aXNlLCBJIGxpa2UgdGhlIGNoYW5nZXMuCj4KPiBX
aXRoIHRoZSBmb2xsb3dpbmc6Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ubWkuaCBi
L2luY2x1ZGUvbGludXgvbm1pLmgKPiBpbmRleCA4MzA3NmJmNzBjZTguLmQxNGZlMzQ1ZWFlOSAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L25taS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9u
bWkuaAo+IEBAIC0xNyw4ICsxNyw2IEBAIHZvaWQgbG9ja3VwX2RldGVjdG9yX3NvZnRfcG93ZXJv
ZmYodm9pZCk7Cj4gIHZvaWQgbG9ja3VwX2RldGVjdG9yX2NsZWFudXAodm9pZCk7Cj4KPiAgZXh0
ZXJuIGludCB3YXRjaGRvZ191c2VyX2VuYWJsZWQ7Cj4gLWV4dGVybiBpbnQgbm1pX3dhdGNoZG9n
X3VzZXJfZW5hYmxlZDsKPiAtZXh0ZXJuIGludCBzb2Z0X3dhdGNoZG9nX3VzZXJfZW5hYmxlZDsK
PiAgZXh0ZXJuIGludCB3YXRjaGRvZ190aHJlc2g7Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIHdh
dGNoZG9nX2VuYWJsZWQ7Cj4KPiBAQCAtNjgsOCArNjYsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
cmVzZXRfaHVuZ190YXNrX2RldGVjdG9yKHZvaWQpIHsgfQo+ICAgKiAnd2F0Y2hkb2dfZW5hYmxl
ZCcgdmFyaWFibGUuIEVhY2ggbG9ja3VwIGRldGVjdG9yIGhhcyBpdHMgZGVkaWNhdGVkIGJpdCAt
Cj4gICAqIGJpdCAwIGZvciB0aGUgaGFyZCBsb2NrdXAgZGV0ZWN0b3IgYW5kIGJpdCAxIGZvciB0
aGUgc29mdCBsb2NrdXAgZGV0ZWN0b3IuCj4gICAqCj4gLSAqICd3YXRjaGRvZ191c2VyX2VuYWJs
ZWQnLCAnbm1pX3dhdGNoZG9nX3VzZXJfZW5hYmxlZCcgYW5kCj4gLSAqICdzb2Z0X3dhdGNoZG9n
X3VzZXJfZW5hYmxlZCcgYXJlIHZhcmlhYmxlcyB0aGF0IGFyZSBvbmx5IHVzZWQgYXMgYW4KPiAr
ICogJ3dhdGNoZG9nX3VzZXJfZW5hYmxlZCcsICd3YXRjaGRvZ19oYXJkbG9ja3VwX3VzZXJfZW5h
YmxlZCcgYW5kCj4gKyAqICd3YXRjaGRvZ19zb2Z0bG9ja3VwX3VzZXJfZW5hYmxlZCcgYXJlIHZh
cmlhYmxlcyB0aGF0IGFyZSBvbmx5IHVzZWQgYXMgYW4KPiAgICogJ2ludGVyZmFjZScgYmV0d2Vl
biB0aGUgcGFyYW1ldGVycyBpbiAvcHJvYy9zeXMva2VybmVsIGFuZCB0aGUgaW50ZXJuYWwKPiAg
ICogc3RhdGUgYml0cyBpbiAnd2F0Y2hkb2dfZW5hYmxlZCcuIFRoZSAnd2F0Y2hkb2dfdGhyZXNo
JyB2YXJpYWJsZSBpcwo+ICAgKiBoYW5kbGVkIGRpZmZlcmVudGx5IGJlY2F1c2UgaXRzIHZhbHVl
IGlzIG5vdCBib29sZWFuLCBhbmQgdGhlIGxvY2t1cAo+Cj4gUmV2aWV3ZWQtYnk6IFBldHIgTWxh
ZGVrIDxwbWxhZGVrQHN1c2UuY29tPgo+Cj4gRXZlbiBiZXR0ZXIgbWlnaHQgYmUgdG8gcmVtb3Zl
IHRoZSB1bnVzZWQgZGVjbGFyYXRpb24gaW4gYSBzZXBhcmF0ZQo+IHBhdGNoLiBJIHRoaW5rIHRo
YXQgbW9yZSBkZWNsYXJhdGlvbnMgYXJlIG5vdCBuZWVkZWQgYWZ0ZXIgbW92aW5nCj4gdGhlIC9w
cm9jIHN0dWZmIGludG8ga2VybmVsL3dhdGNoZG9nLmMuCj4KPiBCdXQgaXQgbWlnaHQgYWxzbyBi
ZSBmaXhlZCBsYXRlci4KCkJyZWFkY3J1bWJzOiBJIHNxdWFzaGVkIHlvdXIgc3VnZ2VzdGlvbiB0
b2dldGhlciB3aXRoIFRvbSdzIHBhdGNoIGFuZApwb3N0ZWQgdGhlIHJlc3VsdDoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyMzA1MjUxNjI4MjIuMS5JMGZiNDFkMTM4ZDE1OGM5MjMwNTcz
ZWFhMzdkYzU2YWZhMmZiMTRlZUBjaGFuZ2VpZAoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
